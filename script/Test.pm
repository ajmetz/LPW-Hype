#!/usr/bin/env perl

package Test;

# Used throughout:
use     strict;
use     warnings;
use     v5.16; # enables 'fc' keyword, as well as unicode_strings and say and other useful things. See https://perldoc.perl.org/feature#FEATURE-BUNDLES
use     utf8;
use     English; # Allows use of $ARG instead of $_. See https://perldoc.perl.org/perlvar


# Global Encoding Settings:
my  $encoding_layer;

SET_ENCODING_LAYER_AT_COMPILE_TIME: BEGIN {
    my  $encoding_to_use                =   'UTF-8'; # Change this to desired encoding value.

    $encoding_layer                     =   ":encoding($encoding_to_use)";  # This is what actually gets used for the layer.
};

use     open ':std'                     ,   "$encoding_layer";  # :std affect is global.
binmode STDIN                           ,   $encoding_layer;
binmode STDOUT                          ,   $encoding_layer;
binmode STDERR                          ,   $encoding_layer;

$ENV{'PERL_UNICODE'}                    =   'AS';               # A = Expect @ARGV values to be UTF-8 strings.
                                                                # S = Shortcut for I+O+E - Standard input, output and error, will be UTF-8.
                                                                # ENV settings are global for current thread and any forked processes.

=pod Pod Documentation for Test.pm

=encoding utf8

=cut

=pod FILENAME, VERSION, SYNOPSIS, DESCRIPTION, VERSION

=head2 FILENAME

Test.pm - Test some Perl stuff.

=head2 VERSION

This is Version v1.0.0.

=cut

our $VERSION                            =   'v1.0.0';

=pod SYNOPSIS, DESCRIPTION, VERSION

=head2 SYNOPSIS

    # Run file at the command line:
    perl ./Test.pm

=head2 DESCRIPTION

Modulino.

=cut

Test->start() unless caller;

=pod SUBROUTINES

=head2 SUBROUTINES

=cut

=head3 Test->start()


=cut

sub start {

    say 'Testing the following: '.sprintf('%02d:%02d', 1, 1);

}

=head2 AUTHOR (en-GB)

Andrew Mehta

=cut

=head2 COPYRIGHT AND LICENSE (en-GB)

Copyright ©2025, Andrew Mehta.

This program is free software; you can redistribute it and/or modify it under the same terms as Perl 5.42.0.
For more details, see the full text of the licenses via L<perlartistic> and L<perlgpl>.
This program is distributed in the hope that it will be useful, but without any warranty;
without even the implied warranty of merchantability or fitness for a particular purpose.

=cut

1;

__END__

