use     Object::Pad v0.821;

class   LPW::Hype::Controller::Shout;

inherit Mojolicious::Controller;

use     LPW::Boilerplate::Code;
use     Template::Nest; # Personal version, patched with "use open ':std', ':encoding(UTF-8)';" to enable utf-8 support.
use     Path::Tiny;
use     Time::Piece;
use     HTML::Entities;

method shout {

    $self->log_trace('Entering shout method.');

    # Premature exit...
    my  $prerequisites      =   $self->stash('shout')->{valid}->{name}
                                && $self->stash('shout')->{valid}->{message}
                                && $self->stash('shout')->{filepath}->realpath
                                && $self->stash('shout')->{backup}->realpath;

    $self->log_trace('Prerequisite boolean used to decide premature exit is...')->log_dump_values($prerequisites);

    #die 'That will do for now';

    return                      $self
                                unless $prerequisites;

    $self->log_trace('We have decided to continue with the shout method.');

    # Initial Values:
    my  $shouts_line_limit  =   500;

    # Date and Time Values:
    my  $time_piece_object  =   localtime;
        $time_piece_object  ->  date_separator('/');

    my  $time_string        =   $time_piece_object->hour && $time_piece_object->min?    sprintf('%02d:%02d', $time_piece_object->hour, $time_piece_object->min):
                                $self->language->localise('shout.time.unknown');

    my  $date_string        =   $time_piece_object->dmy? $time_piece_object->dmy:
                                $self->language->localise('shout.date.unknown');

    $self->log_trace('Our time and date are as follows:')->log_dump_values($time_string,$date_string);

    # Layout Values:
    my  $shout_structure    =   {
        TEMPLATE            =>  'shout.txt',
        TIME                =>  $time_string,
        DATE                =>  $date_string,
        NAME                =>  $self->stash('shout')->{valid}->{name},
        MESSAGE             =>  $self->stash('shout')->{valid}->{message},
    };

    $self->log_trace('Our shout structure is...')->log_dump_values($shout_structure);
    
    # Processing:
    my  $shout              =   Template::Nest->new($self->stash->{layout_settings}->@*)->render($shout_structure);
    my  $shouts             =   $self->stash('shout')->{filepath}->touch->slurp_utf8 // undef;

    $self->log_trace('Our new shout is...')->log_dump_values($shout);
    $self->log_trace('Our past shouts are...')->log_dump_values($shout);
    
    # Appending shout
    if ((defined $shouts) && $shout) { # Using "defined" as $shouts could be an empty string if the slurped file was empty.
        $self->log_trace('Determination made that we have both a new shout, and a string (that could be empty or full) representing past shouts, available to work with.');
        $self->stash('shout')->{backup}->touch->spew_utf8($shouts);
        my  $updated_shouts =   $shout.$shouts;
        $self->stash('shout')->{filepath}->touch->spew_utf8($updated_shouts) if $updated_shouts;
        $self->log_trace('Attempted backup of previous shouts, and saving of new shouts.');
        $self->stash('shout')->{'successful_submission'}    =   $updated_shouts? 1:
                                                                undef;
    }
    else {
        $self->log_trace('Determination made that neither past shouts, nor a new shout, are available to work with.');
        # We should set a general error, and have the homepage action in Root.pm return the params to the user. We don't have a layout design for a general error yet,
        # We could use the field error template with an unknown problem heading, and a try-again-later error message.
    };
    
    return $self->log_trace('Leaving shout method.');
    
    # Some previous experimentation with limiting file size. However, a better approach would be to have two separate files. One for storing all historical shouts.
    # and one that is also a truncated version of the main text file. For now, there's likely no need for a limit, based on my experience with United Games. However, a limit and a backup,
    # may help in the event of some crazy spamming. There is also a truncate option for Path::Tiny's append,
    # and no example of it being used was given, so you'll need to read the source code to understand how it works.

    #my  $truncated_shouts   =   join($line_delimiter, $self->stash(shout)->{filepath}->lines_utf8(count => $shout_line_limit); 

}

__END__

    # Initial values:
    my  $layout_data_structure      =   {
        TEMPLATE                    =>  'main.htm',
        SCRIPTS                     =>  q{},
        CONTENT                     =>  {
            TEMPLATE                =>  'generic-content.htm',
            'SPECIFIC CONTENT'      =>  {
                TEMPLATE            =>  'homepage/content.htm',
            },
        },
    };