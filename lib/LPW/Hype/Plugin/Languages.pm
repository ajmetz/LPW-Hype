use     Object::Pad v0.821;

class   LPW::Hype::Plugin::Languages;

use     LPW::Hype::Boilerplate::Code;
inherit Mojolicious::Plugin;
use     LPW::Hype::Languages;

method register ($app, $config) {

    my  $helpers={
        language    =>  sub {
                            # State will only initialise it once, on a server's initial loading of the mojolicious app, regardless of multiple calls.
                            # Should you wish to change language dynamically, without reloading the app, you should code a dedicated method for that,
                            # within the LPW::Hype::Languages class.
                            # Alternatively, you can move the yml config file to a folder that triggers app reloads, so when the yaml config is changed, the app reloads.
                            state   $language   =   LPW::Hype::Languages->try_or_die(
                                                        $app->config->{'default_language'}
                                                    );
                        },
    };

    $app->helper($ARG => $helpers->{$ARG}) for (keys $helpers->%*);

    return;

}
