
# Custom Libraries:
use Path::Tiny;
use lib path(__FILE__)->parent->sibling('lib')->realpath->stringify;

# Standard Test Boilerplate:
use LPW::Boilerplate::Test;

# Specific Modules used:
use Test::Mojo;

=pod Name, Version, Synopsis, Description

=encoding utf8

=head1 NAME

humble_beginnings.t Test File.

=head1 VERSION

v1.0.0

=cut

our $VERSION                    =   'v1.0.0';

=head1 SYNOPSIS

    yath -v # Will automatically run tests found in the ./t2 folder ( such as this test ), in verbose mode.

=head1 DESCRIPTION

Begins to implement test driven development for the LPW Hype Mojolicious WebApp by Andrew Mehta.

=cut


=head2 Initial Test.

First we test to see if the test is functioning correctly.

=cut

ok(1, "Testing our test can function.");


=head2 get_ok Tests

These tests create a new Test::Mojo object, and use the get_ok method to see if the expected webpages can be obtained.
In each case, a status 200 is sought, and then the content is tested via either a content_like method call,
or a specific DOM lookup via C<< tx->res->dom->at >> etc.

=cut

my  $test_object            =   Test::Mojo->new('Hype');

# Get Tests
ok($test_object->get_ok('/')->status_is(200)->success,                                                  'Our home page exists.'   );

# HTML form tests:
ok($test_object->get_ok('/')->status_is(200)->tx->res->dom->at('form')
                                                                    ->matches('form[method=POST]'),     'Has input form with POST method'       ); 
                                                                    # Didn't pass without the "at" before "matches".
                                                                    # Find could be used, and returns Mojo Collection of find results,
                                                                    # so not an assertion of a match.
ok($test_object->get_ok('/')->status_is(200)->tx->res->dom->at('textarea#shoutbox_display'),            'Our home page has a textarea'          .
                                                                                                        ' for the shoutbox.'                    );

done_testing();

=head1 AUTHOR

Andrew Mehta

=cut

__END__
