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
    return $self unless $self->validation->has_data;

    my  @supported_form_types       =   ('shout_message',);
    my  $valid_form_type            =   $self->validation->required('form_type')->in(@supported_form_types)->is_valid? $self->validation->output:
                                        undef;

    # Assuming form_type only ever has one value,
    # so only one form type will be processed per request,
    # in the order of the ternary questions...

    return $valid_form_type eq 'shout_message'? $self->process_shout_message:
    $self;

}

method process_shout_message {
    return $self;
}

__END__
