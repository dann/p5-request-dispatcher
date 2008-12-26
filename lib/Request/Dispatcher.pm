package Request::Dispatcher;
use Mouse;
use HTTP::Router;
use Request::Dispatcher::Dispatch::Simple;

our $VERSION = '0.01';

has 'router' => (
    is      => 'ro',
    default => sub {
        HTTP::Router->new;
    },
    handles => [qw(add_route)],
);

no Mouse;

sub dispatch_class {
    'Request::Dispatcher::Dispatch::Simple';
}

sub dispatch {
    my ( $self, $request ) = @_;
    my $match = $self->router->match( $request->path,
        { method => $request->method } );
    my $dispatch = $self->dispatch_class->new( match => $match );
    return $dispatch;
}

__PACKAGE__->meta->make_immutable;

1;
__END__

=head1 NAME

Request::Dispatcher - Request dispatcher like Rails

=head1 SYNOPSIS

  use Request::Dispatcher;

=head1 DESCRIPTION

Request::Dispatcher is the request dispatcher like Rails

=head1 AUTHOR

Takatoshi Kitano E<lt>kitano.tk@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
