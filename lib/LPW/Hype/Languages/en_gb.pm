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
my  @trace_phrases;
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
    # or otherwise implementing coding that is
    # relevant to an accurate translation.

    Short: {
        @tokens_short = (


            # LPW::Hype::Controller::Root

            '2024_event.box_heading'                    =>  '2024\'s Event',

            'bottom_of_page.link.back_home'             =>  'Back to Homepage',

            'call_to_action_button.label.2025'          =>  '🐪 ATTEND! 😃',
            'call_to_action_button.label.attend'        =>  'Register To Attend!',
            'call_to_action_button.label.talk'          =>  'Register Your Talk!',
            'call_to_action_button.label.view_schedule' =>  'View Schedule',

            'shoutbox.field_error_heading'              =>  'CAN YOU TRY AGAIN?',
            'shoutbox.loading_message'                  =>  'Shout out messages should load here shortly...',
            'shoutbox.logo_alt_text'                    =>  'SHOUT BOX LOGO',
            'shoutbox.message.descriptive_field_name'   =>  'Message',
            'shoutbox.message_label'                    =>  'Your Message:',
            'shoutbox.name.descriptive_field_name'      =>  'Name',
            'shoutbox.name_label'                       =>  'Your Name:',

            'shout.date.unknown'                        =>  'Unknown Date',
            'shout.time.unknown'                        =>  'Unknown Time',

            'shoutbox.refresh'                          =>  'Refresh / View New Messages',
            




        );
    } #short

    Long: {

        @tokens_long = (

            # LPW::Hype::Controller::Root

            'shoutbox.error.empty_or_zero_length'
                =>  'To successfully submit your shout message, you\'ll need to ensure this [_1] field contains valid text.',            

            'shoutbox.error.name_max_length'
                =>  'To successfully submit your shout message, you\'ll need to ensure this [_1] field contains text that is less than [_2] characters.',

            'shoutbox.error.message_max_length'
                =>  'Have you considered splitting your long message into multiple smaller messages? That way, it will work with our [_2] maximum character limit.',

            'shoutbox.error.unknown_unsafe_word'
                =>  'You should be able to easily edit this [_1] field, to ensure there are no potentially problematic words or characters.',

            'shoutbox.error.unsafe_word'
                =>  'We found the word "[_2]" in this [_1] field, and the message should send if you can try again rephrasing or removing this particular word. Many thanks!',

            'shoutbox.error.no_at_sign'
                =>
'To successfully submit your public message, you should consider removing the @ sign we found in this [_1] field.
To protect your privacy, and the sharing of email addresses publically,
we have chosen to disallow the inclusion of the @ symbol in public messages at present. Thank you for understanding.',

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
    # or otherwise implementing coding that is
    # relevant to an accurate translation.

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
            '...and as a captured unsafe word or empty string:' =>  '...and as a captured unsafe word or empty string:',
            'Checking form_type.'                               =>  'Checking form_type.',
            'Condition is false.'                               =>  'Condition is false.',
            'Condition is true.'                                =>  'Condition is true.',
            'CSRF input is:'                                    =>  'CSRF input is:',
            'Is our condition true or false?'                   =>  'Is our condition true or false?',
            'Not valid form type'                               =>  'Not valid form type',
            'Not valid form type.'                              =>  'Not valid form type.',
            'Our string to check is as follows:'                =>  'Our string to check is as follows:',
            'Our use of words to check for are:'                =>  'Our use of words to check for are:',
            'Processing shout'                                  =>  'Processing shout',
            'Protection is valid.'                              =>  'Protection is valid.',
            'This is the result of our match as a boolean...'   =>  'This is the result of our match as a boolean...',
            'Valid form type'                                   =>  'Valid form type',
            'Valid form type.'                                  =>  'Valid form type.',
            'We have data.'                                     =>  'We have data.',
            'We have data and a valid csrf.'                    =>  'We have data and a valid csrf.',
            'We have protection.'                               =>  'We have protection.',
            'We use this regular expression for matching:'      =>  'We use this regular expression for matching:',
            'Which should match...'                             =>  'Which should match...',

            'This is the result of our match as a captured unsafe word or empty string:'
                =>  'This is the result of our match as a captured unsafe word or empty string:',

            # LPW::Hype::Controller::Root
            'What does our stash look like?'                    =>  'What does our stash look like?',
        );

    } #debug

    Trace: {
        @trace_phrases = (

            # LPW::Hype::Controller::Shout
    
            'Entering shout method.'                            =>  'Entering shout method.',
            'Leaving shout method.'                             =>  'Leaving shout method.',
            'Our new shout is...'                               =>  'Our new shout is...',
            'Our past shouts are...'                            =>  'Our past shouts are...',
            'Our shout structure is...'                         =>  'Our shout structure is...',
            'Our time and date are as follows:'                 =>  'Our time and date are as follows:',

            'Attempted backup of previous shouts, and saving of new shouts.'
                =>  'Attempted backup of previous shouts, and saving of new shouts.',

            'Determination made that neither past shouts, nor a new shout, are available to work with.'
                =>  'Determination made that neither past shouts, nor a new shout, are available to work with.',

            'Determination made that we have both a new shout, and a string (that could be empty or full) representing past shouts, available to work with.'
                =>  'Determination made that we have both a new shout, and a string (that could be empty or full) representing past shouts, available to work with.',

            'Prerequisite boolean used to decide premature exit is...'
                =>  'Prerequisite boolean used to decide premature exit is...',

            'We have decided to continue with the shout method.'
                =>  'We have decided to continue with the shout method.',
        );
    }

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
    @trace_phrases,
    @verbose_phrases,
    @stdout_phrases,
);

}

# ----------------------------------

__END__
