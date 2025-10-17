use     Object::Pad v0.821;

class   LPW::Hype::Controller::Root;

inherit Mojolicious::Controller;

use     LPW::Boilerplate::Code;
use     Template::Nest; # Personal version, patched with "use open ':std', ':encoding(UTF-8)';" to enable utf-8 support.
use     HTML::Entities;

method homepage {

    # Initial Values:
    my  @shoutbox_field_order                       =   qw(
                                                            name
                                                            message
                                                        );
    my  $empty_string                               =   q{};
    my  $non_breaking_space                         =   '&nbsp;';
    my  @shoutbox_field_layouts                     =   (
                        TEMPLATE                    =>  'shoutbox/shoutbox.htm',
                        'SHOUT-BOX-LOGO-ALT-TEXT'   =>  $self->language->localise_html_safe('shoutbox.logo_alt_text'),
                        'SHOUTBOX REFRESH TEXT'     =>  $self->language->localise_html_safe('shoutbox.refresh'),
                        'LOADING MESSAGE'           =>  $self->language->localise_html_safe('shoutbox.loading_message'),
                        'CSRF TOKEN'                =>  $self->csrf_token,
                        'SHOUTBOX LEGAL'            =>  {
                            TEMPLATE                =>  'shoutbox/content/'.$self->language->language_tag().'/legal.htm', # Add validation for dynamic path perhaps?
                        },
                        'CONTENT-COMPLAINT'         =>  {
                            TEMPLATE                =>  'shoutbox/content/'.$self->language->language_tag().'/content_complain.htm', # Add validation for dynamic path perhaps?
                        },
    );

    for my $field (@shoutbox_field_order) {
    
        my  @STANDARD_FIELD_VALUES  =   (
            TEMPLATE                =>  'shoutbox/'.$field.'_field.htm',
            LABEL                   =>  $self->language->localise('shoutbox.'.$field.'_label'),
            VALUE                   =>  $self->stash('shout')->{errors}? encode_entities($self->param($field)):
                                        $empty_string,
            ERROR                   =>  $empty_string, # Blank by default - can be overidden.
        );
    
        push @shoutbox_field_layouts, (
            uc($field).' FIELD'     =>  {
                                            $self->stash('shout')->{errors}->{"$field"}? (
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
                                                                                            'SHOUT FIELD'                           =>  {
                                                                                                @STANDARD_FIELD_VALUES,
                                                                                                ERROR                               =>  $self->stash('shout')->{errors}->{"$field"}, # already html_safe via FormData.pm
                                                                                            },
                                                                                        ):
                                            @STANDARD_FIELD_VALUES,
                                        },
        );
    
    }; # end of for @shoutbox_field_order

    #$self->log_debug('What does our stash look like?')->log_dump_values($self->stash);

    my  $shoutbox_field_layouts =   {@shoutbox_field_layouts};
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
                    'SHOUTBOX'      =>  $shoutbox_field_layouts,
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

method terms_of_service {

    # Initial values:
    my  $blank                      =   q{};
    my  $layout_data_structure      =   {
        TEMPLATE                    =>  'main.htm',
        HEADER                      =>  {
            TEMPLATE                =>  'header.htm',
        },
        CONTENT                     =>  {
            TEMPLATE                =>  'content/'.$self->language->language_tag().'/terms/terms.htm',
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
        },
        CONTENT                     =>  {
            TEMPLATE                =>  'content/'.$self->language->language_tag().'/privacy/privacy_policy.htm',
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

