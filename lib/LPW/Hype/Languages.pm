use     Object::Pad v0.821;

class   LPW::Hype::Languages;

use     LPW::Boilerplate::Code;
inherit Locale::Maketext; # Should it be inherit? We'll wait and see when we need to use it.
use     HTML::Entities;

method try_or_die :common ($language = 'en-GB') {

    my  $error={
        language    =>  'Trouble finding a language to use.',
    };

    #warn 'language is...'.$language;

    return              __PACKAGE__->get_handle($language)
                        || die  $error->{'language'};

}

method localise_html_safe (@ARG) {
    encode_entities(
        $self->localise(@ARG)
    );
}

method localise (@ARG) {
    $self->maketext(@ARG);
}

__END__

language_tag() can be used on the handle returned by try_or_die, and that language handle inherits all methods here.
As such there is no need to have a language_tag method here unless you wish to override the default language_tag method already inherited from Locale::Maketext.
Note the language_tag method returns with dashes not underscores, and all lowercase.
