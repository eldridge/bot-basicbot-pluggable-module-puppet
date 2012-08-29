package Bot::BasicBot::Pluggable::Module::Puppet;

use strict;
use warnings;

=head1 NAME

Bot::BasicBot::Pluggable::Module::Puppet - Limited Remote Control

=head1 DESCRIPTION

simply put, Bot::BasicBot::Pluggable::Module::Puppet
allows you to turn your bot into a puppet by forcing
the bot to talk from remote.

=head1 SYNOPSIS

you will need to load the module into your instance:

 $bot->load('Puppet');

the bot will listen on the address and port specified
in the store by the keys addr and port, respectively.

=cut

our $VERSION = '0.1';

use POE;
use POE::Component::Server::TCP;

use base 'Bot::BasicBot::Pluggable::Module';

=head1 METHODS

=over 4

=item init

initialization method called by the constructor
inheritied by Bot::BasicBot::Pluggable::Module.
our object is instantiated by the load method
in Bot::BasicBot::Pluggable.

a TCP server is created here using POE and a YAML
serializer via POE::Filter::Reference.  the data
that the server expects to receive should be a
hashref that is passed directly to the say method.

=cut

sub init
{
	my $self = shift;

	my $addr = $self->get('addr') || '127.0.0.1';
	my $port = $self->get('port') || 28800;

	new POE::Component::Server::TCP
		Address			=> $addr,
		Port			=> $port,
		ClientFilter	=> [ 'POE::Filter::Reference', 'YAML', 0 ],
		ClientInput		=> sub { $self->say(%{ $_[ARG0] }) }
}

=back

=head1 BUGS

absolutely no access control

=head1 AUTHOR

mike eldridge <diz@cpan.org>

=cut

1;
