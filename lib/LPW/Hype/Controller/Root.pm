use     Object::Pad v0.821;

class   LPW::Hype::Controller::Root;

inherit Mojolicious::Controller;

use     LPW::Boilerplate::Code;
use     Template::Nest; # Personal version, patched with "use open ':std', ':encoding(UTF-8)';" to enable utf-8 support.
use     HTML::Entities;

method homepage {

    # Initial Values:
    my  $shoutbox_layout            =   $self->get_shoutbox_layout;

    my  $layout_data_structure      =   {
        TEMPLATE                    =>  'main.htm',
        #SCRIPTS                     =>  q{},
        HEADER                      =>  {
            TEMPLATE                =>  'header.htm',
            'HOMEPAGE SPONSORS'    =>  {
                TEMPLATE            =>  'homepage_header_sponsors.htm',
            },
            'CALL-TO-ACTION'        =>  {
                        TEMPLATE    =>  'call_to_action_button.htm',
                        URL         =>  '/#2025_event_section',
                        TARGET      =>  '_self',
                        LABEL       =>  $self->language->localise_html_safe('call_to_action_button.label.2025'),            
            },
        },
        NAV                         =>  {
            TEMPLATE                =>  'navigation.htm',
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
                    'REGISTER TO ATTEND'    =>  {
                        TEMPLATE    =>  'call_to_action_button.htm',
                        URL         =>  'https://act.yapc.eu/lpw2025/register',
                        TARGET      =>  '_blank',
                        LABEL       =>  $self->language->localise_html_safe('call_to_action_button.label.attend'),
                    },
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
                    'SHOUTBOX'      =>  $shoutbox_layout,
                },
            },

            'TALKS'               =>  {
                TEMPLATE            =>  'box.htm',
                'BOX HEADING'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/talks/box_heading.htm', # Add validation for dynamic path perhaps?
                },
                'BOX CONTENT'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/talks/box_content.htm', # Add validation for dynamic path perhaps?
                    'REGISTER YOUR TALK'    =>  {
                        TEMPLATE    =>  'call_to_action_button.htm',
                        URL         =>  'https://act.yapc.eu/lpw2025/newtalk',
                        TARGET      =>  '_blank',
                        LABEL       =>  $self->language->localise_html_safe('call_to_action_button.label.talk'),
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
            'HOMEPAGE SPONSORS'     =>  $blank,
            'CALL-TO-ACTION'        =>  $blank,
        },
        NAV                         =>  $blank,
        CONTENT                     =>  {
            TEMPLATE                =>  'content/'.$self->language->language_tag().'/sponsorship/page.htm',
            'GET-IN-TOUCH BUTTON'   =>  {
                TEMPLATE            =>  'content/'.$self->language->language_tag().'/sponsorship/get_in_touch_button.htm',
            },
            'BACK-TO-HOME-PAGE'     =>  {
                TEMPLATE            =>  'back_home.htm',
                'BACK-HOME-TEXT'    =>  $self->language->localise_html_safe('bottom_of_page.link.back_home'),
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

method terms_of_service {

    # Initial values:
    my  $blank                      =   q{};
    my  $layout_data_structure      =   {
        TEMPLATE                    =>  'main.htm',
        HEADER                      =>  {
            TEMPLATE                =>  'header.htm',
            'HOMEPAGE SPONSORS'     =>  $blank,
            'CALL-TO-ACTION'        =>  $blank,
        },
        NAV                         =>  {
            TEMPLATE                =>  'navigation.htm',
        },
        CONTENT                     =>  {
            TEMPLATE                =>  'content/'.$self->language->language_tag().'/terms/terms.htm',
            'BACK-TO-HOME-PAGE'     =>  {
                TEMPLATE            =>  'back_home.htm',
                'BACK-HOME-TEXT'    =>  $self->language->localise_html_safe('bottom_of_page.link.back_home'),
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

method privacy_policy {

    # Initial values:
    my  $blank                      =   q{};
    my  $layout_data_structure      =   {
        TEMPLATE                    =>  'main.htm',
        HEADER                      =>  {
            TEMPLATE                =>  'header.htm',
            'HOMEPAGE SPONSORS'     =>  $blank,
            'CALL-TO-ACTION'        =>  $blank,
        },
        NAV                         =>  {
            TEMPLATE                =>  'navigation.htm',
        },
        CONTENT                     =>  {
            TEMPLATE                =>  'content/'.$self->language->language_tag().'/privacy/privacy_policy.htm',
            'BACK-TO-HOME-PAGE'     =>  {
                TEMPLATE            =>  'back_home.htm',
                'BACK-HOME-TEXT'    =>  $self->language->localise_html_safe('bottom_of_page.link.back_home'),
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

method perl_weekly_update {

    # Initial values:
    my  $blank                      =   q{};
    my  $layout_data_structure      =   {
        TEMPLATE                    =>  'main.htm',
        HEADER                      =>  {
            TEMPLATE                =>  'header.htm',
            'HOMEPAGE SPONSORS'     =>  $blank,
            'CALL-TO-ACTION'        =>  $blank,
        },
        NAV                         =>  {
            TEMPLATE                =>  'navigation.htm',
        },
        CONTENT                     =>  {
            TEMPLATE                =>  'content/'.$self->language->language_tag().'/perl_weekly_update/november03.htm',
            'BACK-TO-HOME-PAGE'     =>  {
                TEMPLATE            =>  'back_home.htm',
                'BACK-HOME-TEXT'    =>  $self->language->localise_html_safe('bottom_of_page.link.back_home'),
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

method talks {

    # Initial values:
    my  $blank                      =   q{};
    my  $layout_data_structure      =   {
        TEMPLATE                    =>  'main.htm',
        HEADER                      =>  {
            TEMPLATE                =>  'header.htm',
            'HOMEPAGE SPONSORS'     =>  $blank,
            'CALL-TO-ACTION'        =>  $blank,
        },
        NAV                         =>  {
            TEMPLATE                =>  'navigation.htm',
        },
        CONTENT                     =>  {
            TEMPLATE                =>  'content/'.$self->language->language_tag().'/talks/page.htm',
            'BACK-TO-HOME-PAGE'     =>  {
                TEMPLATE            =>  'back_home.htm',
                'BACK-HOME-TEXT'    =>  $self->language->localise_html_safe('bottom_of_page.link.back_home'),
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

method news {

    # Initial values:
    my  $blank                      =   q{};
    my  $layout_data_structure      =   {
        TEMPLATE                    =>  'main.htm',
        HEADER                      =>  {
            TEMPLATE                =>  'header.htm',
            'HOMEPAGE SPONSORS'     =>  $blank,
            'CALL-TO-ACTION'        =>  $blank,
        },
        NAV                         =>  {
            TEMPLATE                =>  'navigation.htm',
        },
        CONTENT                     =>  {
            TEMPLATE                =>  'content/'.$self->language->language_tag().'/news/page.htm',
            'REGISTER TO ATTEND'    =>  {
                        TEMPLATE    =>  'call_to_action_button.htm',
                        URL         =>  'https://act.yapc.eu/lpw2025/register',
                        TARGET      =>  '_blank',
                        LABEL       =>  $self->language->localise_html_safe('call_to_action_button.label.attend'),
            },
            'REGISTER YOUR TALK'    =>  {
                        TEMPLATE    =>  'call_to_action_button.htm',
                        URL         =>  'https://act.yapc.eu/lpw2025/newtalk',
                        TARGET      =>  '_blank',
                        LABEL       =>  $self->language->localise_html_safe('call_to_action_button.label.talk'),
            },
            'PERL-WEEKLY-SECTION'   =>  {
                TEMPLATE            =>  'content/'.$self->language->language_tag().'/perl_weekly_update/november03.htm',
                'BACK-TO-HOME-PAGE' =>  $blank,
            },
            'BACK-TO-HOME-PAGE'     =>  {
                TEMPLATE        =>  'back_home.htm',
                'BACK-HOME-TEXT'=>  $self->language->localise_html_safe('bottom_of_page.link.back_home'),
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


method get_shoutbox_layout {

    # Initial values:
    my  @shoutbox_field_order                           =   qw(
                                                                name
                                                                message
                                                            );
    my  $empty_string                                   =   q{};
    my  $non_breaking_space                             =   '&nbsp;';

    my  @shoutbox_layout                                =   (
                        TEMPLATE                        =>  'shoutbox/shoutbox.htm',
                        'SHOUT-BOX-LOGO-ALT-TEXT'       =>  $self->language->localise_html_safe('shoutbox.logo_alt_text'),
                        'SHOUTBOX REFRESH TEXT'         =>  $self->language->localise_html_safe('shoutbox.refresh'),
                        'LOADING MESSAGE'               =>  $self->language->localise_html_safe('shoutbox.loading_message'),
                        'CSRF TOKEN'                    =>  $self->csrf_token,
                        'SHOUTBOX LEGAL'                =>  {
                            TEMPLATE                    =>  'shoutbox/content/'.$self->language->language_tag().'/legal.htm', # Add validation for dynamic path perhaps?
                        },
                        'CONTENT-COMPLAINT'             =>  {
                            TEMPLATE                    =>  'shoutbox/content/'.$self->language->language_tag().'/content_complain.htm', # Add validation for dynamic path perhaps?
                        },
                        'SUBMISSION-RESULT-IF-SUCCESS'  =>  $self->stash('shout')->{'successful_submission'}?   {
                                                                                                                    TEMPLATE    =>  'shoutbox/submission_result_anchor.htm',
                                                                                                                }:
                                                            $empty_string,
    );


    my  $first                      =   1;  # Start with true value,
                                            # for use in loop below.
    for my $field (@shoutbox_field_order) {

        my  @STANDARD_FIELD_VALUES  =   (
            TEMPLATE                =>  'shoutbox/'.$field.'_field.htm',
            LABEL                   =>  $self->language->localise('shoutbox.'.$field.'_label'),
            VALUE                   =>  $self->stash('shout')->{errors}->%*? encode_entities($self->param($field)):
                                        $empty_string,
            ERROR                   =>  $empty_string, # Blank by default - can be overidden.
        );

        my  $field_error            =   $self->stash('shout')->{errors}->%*
                                        && $self->stash('shout')->{errors}->{"$field"};
    
        push @shoutbox_layout, (
            uc($field).' FIELD'     =>  {
                                            $field_error?   (
                                                                TEMPLATE                                =>  'shoutbox/field_error.htm',
                                                                'ERROR-HEADING-INITIAL-CHARACTER'       =>  encode_entities(
                                                                                                                join '',
                                                                                                                map {
                                                                                                                    my $backwards_heading = reverse ($ARG);
                                                                                                                    chop $backwards_heading;
                                                                                                                }
                                                                                                                (
                                                                                                                    $self->language->localise('shoutbox.field_error_heading'),
                                                                                                                )
                                                                                                            ),
                                                                'ERROR-HEADING-REMAINING-CHARACTERS'    =>  join('',
                                                                                                                map {
                                                                                                                    my  $string =   $ARG;
                                                                                                                    $string     =~  s/ /$non_breaking_space/ig;
                                                                                                                    $string;
                                                                                                                }
                                                                                                                (
                                                                                                                    encode_entities(
                                                                                                                        join(
                                                                                                                            '',
                                                                                                                            map {
                                                                                                                                my $backwards_heading = reverse ($ARG);
                                                                                                                                chop ($backwards_heading);
                                                                                                                                scalar reverse ($backwards_heading);
                                                                                                                            }
                                                                                                                            (
                                                                                                                                $self->language->localise('shoutbox.field_error_heading'),
                                                                                                                            )
                                                                                                                        ),
                                                                                                                    ),
                                                                                                                ),
                                                                                                            ),
                                                                'SUBMISSION-RESULT-IF-FIRST-ERROR'      =>  $first? {
                                                                                                                        TEMPLATE    =>  'shoutbox/submission_result_anchor.htm',
                                                                                                                    }:
                                                                                                            $empty_string,
                                                                'SHOUT FIELD'                           =>  {
                                                                    @STANDARD_FIELD_VALUES,
                                                                    ERROR                               =>  $self->stash('shout')->{errors}->{"$field"}, # already html_safe via FormData.pm
                                                                },
                                                            ):
                                            @STANDARD_FIELD_VALUES, # Fallback / default.
                                        },
        );

        $first                      =   0
                                        if $field_error;

    }; # end of for @shoutbox_field_order

    #$self->log_debug('What does our stash look like?')->log_dump_values($self->stash);
    #$self->log_dump_values($self->app->mode); #deployment
    return {@shoutbox_layout};

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

