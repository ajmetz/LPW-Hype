use     Object::Pad v0.821;

class   LPW::Hype 1.00;

use     LPW::Boilerplate::Code;
use     Path::Tiny;
inherit Mojolicious;

# This method will run once at server start
method startup {

    $self
    ->get_configuration_from_file
    ->configure_the_application
    ->load_additional_plugins;

}

method get_configuration_from_file {

    $self->plugin('NotYAMLConfig');
    return $self;

}

method configure_the_application {

    $self           ->  secrets(
                            $self->config->{secrets}
                        );

    return $self    ->  exclude_author_commands
                    ->  setup_customisation_of_mojolicious_file_paths
                    ->  setup_template_nest
                    ->  setup_shoutbox
                    ->  configure_validation; # returns self

}


method load_additional_plugins {

    $self->plugin('LPW::Hype::Plugin::Languages');
    $self->plugin('LPW::Hype::Plugin::Log');
    $self->plugin('LPW::Hype::Plugin::Routes');
    return $self;

}

method exclude_author_commands {

    # Exclude author commands...
    $self->commands->namespaces([
        'Mojolicious::Command',
    ]);
    # ...by setting just Mojolicious::Command
    # and not Mojolicious::Command
    # and Mojolicious::Command::Author::whatever)

    return $self;

}

method setup_customisation_of_mojolicious_file_paths {

    #Initial Values:
    my  $files                  =   $self->home->rel_file('lib/LPW/Hype/Files');

    # Switch to installable "public" directory
    $self->static->paths->[0]   =   $files->child('public');

    # Switch to installable "templates" directory
    $self->renderer->paths->[0] =   $files->child('templates');

    return $self;

}

method setup_template_nest {

    $self->defaults(

        # Store Template::Nest setup data in the stash:
        layout_settings         =>   [

            template_dir        =>  $self->app->home->rel_file('lib/LPW/Hype/Files')->child('layouts')->to_string,
            token_delims        =>  ['PUT','HERE'],
            escape_char         =>  '\\',
            name_label          =>  'TEMPLATE',
            token_placeholder   =>  "\\PUT PUT param_name HERE \\HERE",
            template_ext        =>  '', # Blank so can declare extension under the NAME key.
                                        # This will allow me to use htm and html
                                        # or anything else as I wish.

            fixed_indent        =>  0,  # Off (0)
                                        # - On (1) would be nice for tidy source code,
                                        # and would mess with white space in substituted multi-line values
                                        # - i.e. textarea values, or hidden form values -
                                        # so I've decided to keep this off.

        ],

    );

    return $self;

}

method setup_shoutbox {

    my  $filepath       =   # From Config:
                            $self->config->{shoutbox_text_filepath}?    $self->config->{shoutbox_text_filepath}:
                            # Or fall back to a sensible default:
                            $self->app->home->rel_file('lib/LPW/Hype/Files/public/text/')->child('shoutbox_text.txt')->to_string;

    $self->defaults(

        # Store setup data in the stash:
        shout           =>  {
            errors      =>  {},
            valid       =>  {},
            filepath    =>  path($filepath),
            backup      =>  path(
                                path($filepath)->parent->stringify,
                                'backup.txt',
                            ),
        },

    );

    return $self;

}

method configure_validation {
    $self->validation->validator->add_check(unlike => sub { $_[2] =~ $_[3] });
    return $self;
}

__END__