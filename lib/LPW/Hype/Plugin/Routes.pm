use     Object::Pad v0.821;

class   LPW::Hype::Plugin::Routes;

use     LPW::Boilerplate::Code;
inherit Mojolicious::Plugin;

method register ($app, $conf) {

    # Pre-processing:
    my  $routes =   $app->routes
                    ->under->to('FormData#check_for_language_change')
                    ->under->to('FormData#process_according_to_type')
                    ->under->to('Shout#shout');

    # Default at root:
    $routes
        ->any('/')                  ->to('Root#'.   'homepage'          ); # Dedicated entry for matching simply '/' (root)

    # Root.pm:
    $routes
        ->any('/sponsorship')       ->to('Root#'.   'sponsorship'       );
    $routes
        ->any('/terms_of_service')  ->to('Root#'.   'terms_of_service'  );
    $routes
        ->any('/privacy_policy')    ->to('Root#'.   'privacy_policy'    );
    $routes
        ->any('/perl-weekly-update')->to('Root#'.   'perl_weekly_update');


    # Default / fall back for anything else (other than simply root)...
    $routes
        ->any('/*rest_of_url')      ->to('Root#'.   'homepage'          ); # Does not match '/' and only matches '/some-stuff'

    return;

}