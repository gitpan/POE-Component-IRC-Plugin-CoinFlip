#!/usr/bin/env perl

use Test::More tests => 3;

BEGIN {
    use_ok('POE');
    use_ok('POE::Component::IRC::Plugin::BaseWrap');
	use_ok( 'POE::Component::IRC::Plugin::CoinFlip' );
}

diag( "Testing POE::Component::IRC::Plugin::CoinFlip $POE::Component::IRC::Plugin::CoinFlip::VERSION, Perl $], $^X" );
