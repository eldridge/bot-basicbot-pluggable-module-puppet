#!/usr/bin/perl -w

use warnings;
use strict;

use inc::Module::Install;

name			'Bot-BasicBot-Pluggable-Module-Puppet';
author			'Mike Eldridge <diz@cpan.org>';
license			'perl';

build_requires	'Bot::BasicBot::Pluggable' => '0.04';

version_from	'lib/Bot/BasicBot/Pluggable/Module/Puppet.pm';

auto_install;

WriteAll;
