use Test::More tests => 5;

use_ok('Bot::BasicBot::Pluggable');
use_ok('Bot::BasicBot::Pluggable::Store');
use_ok('Bot::BasicBot::Pluggable::Module::Puppet');

no warnings 'redefine';
sub Bot::BasicBot::Pluggable::Module::store { 1; }

my $bot = new Bot::BasicBot::Pluggable;
isa_ok($bot, 'Bot::BasicBot::Pluggable', 'basic bot');

ok($bot->load('Puppet'), 'load Puppet module');

