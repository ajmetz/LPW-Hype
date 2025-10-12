use     Object::Pad v0.821;

class   LPW::Hype::Controller::FormData;

inherit Mojolicious::Controller;

use     LPW::Hype::Boilerplate::Code;
use     Template::Nest; # Personal version, patched with "use open ':std', ':encoding(UTF-8)';" to enable utf-8 support.

method check_for_language_change {
    return $self unless $self->validation->has_data;

    my  @supported_languages        =   ('en-GB',); # Supported languages should not be hard coded here, and instead dynamic based on actual languages found to be present.
    my  $valid_language_requested   =   $self->validation->required('language')->in(@supported_languages)->is_valid? $self->validation->output:
                                        undef;
                                        # Why are we defining a variable about language use and then never using it?
    return $self;

}

method process_according_to_type {
#    $self->log_trace('Checking form_type')
#    ->log_debug('CSRF input is:')
#    ->log_dump_values($self->validation->input->{csrf_token})
#    ->log_debug('Which should match...')
#    ->log_dump_values($self->csrf_token);

#    my  $condition  =   $self->validation->has_data
#                        && $self->validation->csrf_protect->is_valid;
                        
#    $self->log_debug('Is our condition true or false?')->log_dump_values($condition);
#    $self->log_debug('Condition is true.') if $condition;
#    $self->log_debug('Condition is false.') unless $condition;
    
    $self->log_debug('We have data.') if $self->validation->has_data;
#    $self->log_debug('We have protection.') if $self->validation->csrf_protect;
    $self->log_debug('Protection is valid.') if $self->validation->required('csrf_token')->equal_to($self->csrf_token)->is_valid; # Does not work as expected.
 #   $self->log_debug('Protection is valid.') unless $self->validation->csrf_protect->has_error('csrf_token');
#    $self->log_dump_values(
#        $self->validation->error('csrf_token')
#    );
    $self->log_dump_values(
        $self->validation->failed
    );
    return $self                        unless  ($self->validation->has_data
                                                && $self->validation->csrf_protect->is_valid);
    $self->log_trace('We have data and a valid csrf');
    my  @supported_form_types       =   ('shout_message',);
    my  $valid_form_type            =   $self->validation->required('form_type')->in(@supported_form_types)->is_valid? $self->validation->output->{'form_type'}:
                                        undef;

    $self->log_trace('Not valid form type') unless $valid_form_type;
    $self->log_trace('Valid form type') if $valid_form_type;
    $self->log_dump_values($valid_form_type);

    # Assuming form_type only ever has one value,
    # so only one form type will be processed per request,
    # in the order of the ternary questions...

    return ($valid_form_type eq 'shout_message')? $self->process_shout_message:
    $self;

}

method process_shout_message {
    $self->log_trace('Processing shout');
    my  $no_unsafe_words    =   qr/[^(textarea)]/i;
    $self->stash(
        'valid_shout'   =>  $self->validation
                            ->required('name', 'not_empty')->size(1,undef)
                            ->required('message','not_empty')->size(1,undef)->like($no_unsafe_words)
                            ->is_valid? $self->validation->output:
                            undef,
        'shout_errors'  =>  $self->validation->has_error?   'There was an error':
                            'There was no error',
    );
    return $self;
}

__END__
