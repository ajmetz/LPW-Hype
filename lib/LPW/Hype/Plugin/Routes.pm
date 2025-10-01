use     Object::Pad v0.821;

class   LPW::Hype::Plugin::Routes;

use     LPW::Hype::Boilerplate::Code;
inherit Mojolicious::Plugin;

method register ($app, $conf) {

    my  $routes =   $app->routes->under->to('Root#auto');

    # Default at root:
    $routes
        ->any('/')              ->to('Root#'.   'homepage'      ); # Dedicated entry for matching simply '/' (root)

    # Root.pm:
    $routes
        ->any('/hello')         ->to('Root#'.   'hello_world'   );

    # Default / fall back for anything else (other than simply root)...
    $routes
        ->any('/*rest_of_url')  ->to('Root#'.   'homepage'      ); # Does not match '/' and only matches '/some-stuff'

    return;

}