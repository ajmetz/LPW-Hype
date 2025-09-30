use     Object::Pad v0.821;

class   Hype::Languages::en_gb;

use     Hype::Boilerplate::Code;

inherit Hype::Languages;

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

    Short: {
        @tokens_short = (


            # Hype::Controller::Root

            # Nothing yet.

        );
    } #short

    Long: {

        @tokens_long = (

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
