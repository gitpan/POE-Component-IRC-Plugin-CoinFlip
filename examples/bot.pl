use strict;
use warnings;

use lib qw(lib ../lib);
use POE qw(Component::IRC  Component::IRC::Plugin::CoinFlip);

my $irc = POE::Component::IRC->spawn(
    nick        => 'CoinBot',
    server      => 'irc.freenode.net',
    port        => 6667,
    ircname     => 'CoinBot',
);

POE::Session->create(
    package_states => [
        main => [ qw(_start irc_001) ],
    ],
);

$poe_kernel->run;

sub _start {
    $irc->yield( register => 'all' );

    $irc->plugin_add(
        'CoinFlip' =>
            POE::Component::IRC::Plugin::CoinFlip->new
    );

    $irc->yield( connect => {} );
}

sub irc_001 {
    $irc->yield( join => '#zofbot' );
}