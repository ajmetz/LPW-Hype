use     Object::Pad v0.821;

class   Hype::Controller::Root;

inherit Mojolicious::Controller;

use     Hype::Boilerplate::Code;
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
        SCRIPTS                     =>  q{},
        CONTENT                     =>  {
            TEMPLATE                =>  'generic-content.htm',
            'SPECIFIC CONTENT'      =>  {
                TEMPLATE            =>  'homepage/content.htm',
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