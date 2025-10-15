use     Object::Pad v0.821;

class   LPW::Hype::Controller::FormData;

inherit Mojolicious::Controller;

use     LPW::Boilerplate::Code;
use     Template::Nest; # Personal version, patched with "use open ':std', ':encoding(UTF-8)';" to enable utf-8 support.

method check_for_language_change {
    return $self unless $self->validation->has_data;

    my  @supported_languages        =   ('en-GB',); # Supported languages should not be hard coded here, and instead dynamic based on actual languages found to be present.
    my  $valid_language_requested   =   $self->validation->optional('language')->in(@supported_languages)->is_valid? $self->validation->param:
                                        undef;
                                        # Why are we defining a variable about language use and then never using it?
    return $self;

}

method process_according_to_type {

    $self->log_trace('Checking form_type.');

    return $self                        unless  ($self->validation->has_data
                                                && $self->validation->csrf_protect);

    $self->log_trace('We have data and a valid csrf.');

    my  @supported_form_types       =   ('shout',);
    my  $valid_form_type            =   $self->validation->required('form_type')->in(@supported_form_types)->is_valid? $self->validation->output->{'form_type'}:
                                        undef;

    $self->log_trace('Not valid form type.') unless $valid_form_type;
    $self->log_trace('Valid form type.') if $valid_form_type;
    $self->log_dump_values($valid_form_type);

    # Assuming form_type only ever has one value,
    # so only one form type will be processed per request,
    # in the order of the ternary questions...

    return ($valid_form_type eq 'shout')? $self->process_shout:
    $self;

}

method arrayref_to_regex_OR_string    ($list) {

    return  join '|',
            map {
                $ARG?   quotemeta(scalar $ARG):
                ()
            }
            $list->@*; # What if a list item is a qr// string - or specifically not a scalar? TODO: Check for this and report an error/exception? For now we use it in scalar context to fail silently.

}

=pod

=over

item $self->get_specific_unsafe_word($string_to_check, $arrayref_of_values_to_check_for);

Takes a string to check, and an arrayref of values to check for,
and returns the part of the string that matched the values to check for.
Values expected to be strings and not regexes themselves.

=back

=cut

method get_specific_unsafe_word ($string, $unsafe_words) {
    my  $unsafe_word_regex_string           =   $self->arrayref_to_regex_OR_string($unsafe_words);
    my  $matches_and_captures_unsafe_word   =   qr/
                                                    (?<unsafe_word>                 # Start named capturing grouping
                                                        ($unsafe_word_regex_string) # Match any unsafe words in this subgrouping
                                                    )                               # Close capturing group
                                                /ix;
    
    return  ($string =~ $matches_and_captures_unsafe_word)?   $+{unsafe_word}:
            q{};
}



method process_shout {

    $self->log_trace('Processing shout');

    my  $unsafe_words               =   [qw(
                                            textarea
                                        )];
    my  $unsafe_words_regex_string  =   $self->arrayref_to_regex_OR_string($unsafe_words);
    my  $no_unsafe_words            =   qr/[^($unsafe_words_regex_string)]/i;
    my  $no_at_sign                 =   qr/[^@]/i;

    for my $field ('name', 'message') {
        $self->stash('shout')->{errors}->{"$field"} =   $self->validation->required($field, 'not_empty')->size(1,undef)->has_error($field)? $self->language->localise_html_safe(
                                                                                                                                                'shoutbox.error.empty_or_zero_length',
                                                                                                                                                $self->language->localise("shoutbox.$field.descriptive_field_name")
                                                                                                                                            ):
                                                        $self->validation->topic($field)->like($no_unsafe_words)->has_error($field)?        $self->language->localise_html_safe(
                                                                                                                                                $self->get_specific_unsafe_word($self->validation->param($field),$unsafe_words)?
                                                                                                                                                    (
                                                                                                                                                        'shoutbox.error.unsafe_word',
                                                                                                                                                        $self->get_specific_unsafe_word($self->validation->param($field),$unsafe_words),
                                                                                                                                                    ):
                                                                                                                                                    'shoutbox.error.unknown_unsafe_word',
                                                                                                                                            ):
                                                        $self->validation->topic($field)->like($no_at_sign)->has_error($field)?             $self->language->localise_html_safe('shoutbox.error.no_at_sign'):
                                                        undef;
    };

    return $self;
}

__END__


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
    $self->log_debug('We have protection.') if $self->validation->csrf_protect;
#    $self->log_debug('Protection is valid.') if $self->validation->required('csrf_token')->like(scalar $self->csrf_token)->is_valid; # Does not work as expected.
 #   $self->log_debug('Protection is valid.') unless $self->validation->csrf_protect->has_error('csrf_token');
#    $self->log_dump_values(
#        $self->validation->error('csrf_token')
#    );
    $self->log_dump_values(
        $self->validation->failed
    );