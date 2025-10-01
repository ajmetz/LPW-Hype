use     Object::Pad v0.821;

class   LPW::Hype::Controller::Root;

inherit Mojolicious::Controller;

use     LPW::Hype::Boilerplate::Code;
use     Template::Nest;

method auto {

    my  @supported_languages        =   ('en-GB',);
    my  $valid_language_requested   =   $self->validation->has_data
                                        && $self->validation->required('language')->in(@supported_languages)->is_valid? $self->validation->output:
                                        undef;
    return $self;
                                        
}

method hello_world {

    $self->render(
        text => "Hello World!",
    );

}

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
                'BOX HEADING'       =>  $self->language->localise_html_safe('2024_event.box_heading'),
                'BOX CONTENT'       =>  {
                    TEMPLATE        =>  'content/'.$self->language->language_tag().'/2024_event.htm', # Add validation for dynamic path perhaps?
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