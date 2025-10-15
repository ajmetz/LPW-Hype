use     Object::Pad v0.821;

class   LPW::Hype::Languages::en_gb;

use     LPW::Boilerplate::Code;

inherit LPW::Hype::Languages;

# ----------------------------------

en_GB_Tokens_Phrases_Lexicon: {

#my  $new_line                   =   "\n";

my  @tokens_short;
my  @tokens_long;
my  @webapp_phrases;
my  @debug_phrases;
my  @verbose_phrases;
my  @stdout_phrases;

Tokens: {

    # Comment Headings Style Guide:
    # -----------------------------
    # Class Names if only a few tokens/phrases.
    # Class Names with subroutine names,
    # if it makes more sense due to the number of phrases.
    # Two blank lines above each heading.

    # Key Value Style Guide:
    # -----------------------------
    # All on one line for short tokens.
    # For long tokens, fat comma on new line,
    # with one line translations on the same line as the fat comma
    # and multi-line translations on the line below the fat comma,
    # flushed to the left.

    # Ordering Style Guide
    # -----------------------------
    # Alphabetical where possible.
    # Leading underscores ignored, as these may be added
    # or removed depending on whether the method is made
    # public or private.

    # Content Style Guide
    # -----------------------------
    # Content should be UTF-8 plain text,
    # as if any HTML entity encoding,
    # or URL encoding is needed,
    # that encoding will be performed in the codebase,
    # rather than here,
    # and we wish to avoid double encoding errors,
    # so this is a purely text, and purely translation zone,
    # free of code and encodings,
    # unless using a translation function,
    # or coding relevant to accurate translation.

    Short: {
        @tokens_short = (


            # LPW::Hype::Controller::Root

            '2024_event.box_heading'    =>  '2024\'s Event',
            'shoutbox.refresh'          =>  'Refresh / View New Messages',
            'shoutbox.logo_alt_text'    =>  'SHOUT BOX LOGO',
            'shoutbox.loading_message'  =>  'Shout out messages should load here shortly...',
            'shoutbox.name_label'       =>  'Your Name:',
            'shoutbox.message_label'    =>  'Your Message:',

        );
    } #short

    Long: {

        @tokens_long = (

            # LPW::Hype::Controller::Root

            # Nothing yet.

        );
    } #long

} # tokens

Phrases: {

    # Comment Headings Style Guide:
    # -----------------------------
    # Use heading 'Commonly used:' for common phrases.
    # For all other headings use class names with subroutine names.
    # Leave two blank lines between headings.

    # Key Value Style Guide:
    # -----------------------------
    # Key and value on same line unless key is long.
    # Lines should have their fat commas space-aligned
    # via four-space tabbing.
    # When not on the same line,
    # fat commas should be four-space-tabbed one tab in,
    # under the previous line.
    # Long keys and values and anything multi-lined,
    # to be collated in a section one blank line down
    # from the previous short keys and values.
    # Both alphabetically ordered independent of one another.
    # I.e. Under a single heading,
    # alphabetically sorted short keys and values,
    # followed by alphabetically sorted long keys and values,
    # with a blank line between short and long.

    # Ordering Style Guide
    # -----------------------------
    # Alphabetical where possible.
    # Under each heading, the set of short phrases
    # and set of long phrases,
    # are each sorted independently from one another.

    # Content Style Guide
    # -----------------------------
    # Content should be UTF-8 plain text,
    # as if any HTML entity encoding,
    # or URL encoding is needed,
    # that encoding will be performed in the codebase,
    # rather than here,
    # and we wish to avoid double encoding errors,
    # so this is a purely text, and purely translation zone,
    # free of code and encodings,
    # unless using a translation function,
    # or coding relevant to accurate translation.

    Webapp: {

        @webapp_phrases = (


            # Commonly used...

            # Nothing yet.

        );

    } #webapp

    Debug: {

        @debug_phrases = (


            # Commonly used...

            # Nothing yet.

            # LPW::Hype::Controller::FormData
            'Checking form_type.'    =>  'Checking form_type.',
            'Processing shout'      =>  'Processing shout',
            'Not valid form type'   =>  'Not valid form type',
            'Valid form type'       =>  'Valid form type',
            'CSRF input is:'        =>  'CSRF input is:',
            'Which should match...' =>  'Which should match...',
            'Is our condition true or false?'   =>  'Is our condition true or false?',
            'Condition is true.'    =>  'Condition is true.',
            'Condition is false.'    =>  'Condition is false.',
            'We have data.'         =>  'We have data.',
            'We have protection.'   =>  'We have protection.',
            'Protection is valid.'  =>  'Protection is valid.',
            'We have data and a valid csrf.'    =>  'We have data and a valid csrf.',

            'Not valid form type.'  =>  'Not valid form type.',
            'Valid form type.'      =>  'Valid form type.',
        );
    } #debug

    Verbose: {

        @verbose_phrases =(
        );

    }

    Stdout: {

        @stdout_phrases =(
        );

    }

} #phrases

our %Lexicon = (
    #'_AUTO' => 1, # Commented out the auto for now.
    @tokens_short,
    @tokens_long,
    @webapp_phrases,
    @debug_phrases,
    @verbose_phrases,
    @stdout_phrases,
);

}

# ----------------------------------

__END__
