use     Object::Pad v0.821;

class   LPW::Hype::Controller::Root;

inherit Mojolicious::Controller;

use     LPW::Boilerplate::Code;
use     Template::Nest; # Personal version, patched with "use open ':std', ':encoding(UTF-8)';" to enable utf-8 support.

method homepage {

    # Initial values:
    my  $layout_data_structure      =   {
        TEMPLATE                    =>  'main.htm',
        #SCRIPTS                     =>  q{},
        HEADER                      =>  {
            TEMPLATE                =>  'header.htm',
        },
        CONTENT                     =>  {
            TEMPLATE                =>  'homepage.htm',

            '2024 EVENT'            =>  {
                TEMPLATE            =>  'box.htm',
                'BOX HEADING'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/2024_event/box_heading.htm', # Add validation for dynamic path perhaps?
                },
                'BOX CONTENT'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/2024_event/box_content.htm', # Add validation for dynamic path perhaps?
                },
            },

            '2025 EVENT'            =>  {
                TEMPLATE            =>  'box.htm',
                'BOX HEADING'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/2025_event/box_heading.htm', # Add validation for dynamic path perhaps?
                },
                'BOX CONTENT'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/2025_event/box_content.htm', # Add validation for dynamic path perhaps?
                },
            },

            'WORD'                  =>  {
                TEMPLATE            =>  'box.htm',
                'BOX HEADING'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/word/box_heading.htm', # Add validation for dynamic path perhaps?
                },
                'BOX CONTENT'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/word/box_content.htm', # Add validation for dynamic path perhaps?
                },
            },

            'YOUR SAY'              =>  {
                TEMPLATE            =>  'box.htm',
                'BOX HEADING'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/your_say/box_heading.htm', # Add validation for dynamic path perhaps?
                },
                'BOX CONTENT'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/your_say/box_content.htm', # Add validation for dynamic path perhaps?
                    'SHOUTBOX'      =>  {
                        TEMPLATE    =>  'shoutbox/shoutbox.htm',
                        'SHOUT-BOX-LOGO-ALT-TEXT'   =>  $self->language->localise_html_safe('shoutbox.logo_alt_text'),
                        'SHOUTBOX REFRESH TEXT'     =>  $self->language->localise_html_safe('shoutbox.refresh'),
                        'LOADING MESSAGE'           =>  $self->language->localise_html_safe('shoutbox.loading_message'),
                        'CSRF TOKEN'                =>  $self->csrf_token,
                        'NAME LABEL'                =>  $self->language->localise_html_safe('shoutbox.name_label'),
                        'MESSAGE LABEL'             =>  $self->language->localise_html_safe('shoutbox.message_label'),
                        'NAME ERROR'
                                    =>  reftype($self->stash('shout_errors')) eq 'HASH'? $self->stash('shout_errors')->{name} // q{}:q{},
                        'MESSAGE ERROR'
                                    =>  reftype($self->stash('shout_errors')) eq 'HASH'? $self->stash('shout_errors')->{message} // q{}:q{},
                    },
                },
            },

            'CONTACT'               =>  {
                TEMPLATE            =>  'box.htm',
                'BOX HEADING'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/contact/box_heading.htm', # Add validation for dynamic path perhaps?
                },
                'BOX CONTENT'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/contact/box_content.htm', # Add validation for dynamic path perhaps?
                },
            },

            'SPONSORSHIP'           =>  {
                TEMPLATE            =>  'box.htm',
                'BOX HEADING'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/sponsorship/box_heading.htm', # Add validation for dynamic path perhaps?
                },
                'BOX CONTENT'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/sponsorship/box_content.htm', # Add validation for dynamic path perhaps?
                },
            },

        },
    };

    # Processing:
    my  $layout                     =   Template::Nest->new($self->stash->{layout_settings}->@*)->render($layout_data_structure);

    # Output:
    $self->render(
        text                        =>  $layout,
    );

}

method sponsorship {

    # Initial values:
    my  $blank                      =   q{};
    my  $layout_data_structure      =   {
        TEMPLATE                    =>  'main.htm',
        HEADER                      =>  {
            TEMPLATE                =>  'header.htm',
        },
        CONTENT                     =>  {
            TEMPLATE                =>  'content/'.$self->language->language_tag().'/sponsorship/page.htm',
            'GET-IN-TOUCH BUTTON'   =>  {
                TEMPLATE            =>  'content/'.$self->language->language_tag().'/sponsorship/get_in_touch_button.htm',
            },
        },
    };

    # Processing:
    my  $layout                     =   Template::Nest->new($self->stash->{layout_settings}->@*)->render($layout_data_structure);

    # Output:
    $self->render(
        text                        =>  $layout,
    );

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