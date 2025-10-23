use     Object::Pad v0.821;

class   LPW::Hype::Plugin::Log;

use     LPW::Boilerplate::Code;
inherit Mojolicious::Plugin;

use     Mojo::Util qw(dumper);

method register ($app, $config) {

    my  $production_environment =   $app->mode eq 'deployment';

    my  $helpers                =   {

        log_debug               =>  sub ($self, @arguments) {
        
                                        $self->log->debug(
                                            $self->language->localise(@arguments),
                                        );
        
                                        return $self;
        
                                    },

        log_trace               =>  sub ($self, @arguments) {
        
                                        $self->log->trace(
                                            $self->language->localise(@arguments),
                                        );
        
                                        return $self;
        
                                    },

        log_error               =>  sub ($self, @arguments) {
        
                                        $self->log->error(
                                            $self->language->localise(@arguments),
                                        );
        
                                        return $self;
        
                                    },

        log_fatal               =>  sub ($self, @arguments) {
        
                                        $self->log->fatal(
                                            $self->language->localise(@arguments),
                                        );
                                        # Will the next line execute, if this is fatal?
                                        return $self;
        
                                    },

        log_dump_values         =>  sub ($self, @arguments) {
        
                                        return $self if $production_environment;
        
                                        $self->log->info(
                                            "-\n".dumper(@arguments)
                                        );
        
                                        return $self;
        
                                    },
    };

    for my $current (keys $helpers->%*) {
        $app->helper($current   =>  $helpers->{$current});
    };

    return;

}
