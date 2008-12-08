package Request::Dispatcher::Dispatch::Simple;
use Mouse;
use Carp ();
use UNIVERSAL::require;
extends 'Request::Dispatcher::Dispatch';

sub find_controller_instance {
    my ( $self, $args ) = @_;
    my $controller = delete $args->{controller};
    $controller->require or Carp::croak("ooops. Can't require $controller");
    $controller->new;
}

sub execute_action {
    my ( $self, $args ) = @_;
    my $controller = $args->{controller};
    my $action     = $args->{action};
    my $params     = $args->{params};
    eval { $controller->$action($params); };
    if (@_) {
        Carp::croak "ooops $controller can't execute $action method" . @_;
    }
}

__PACKAGE__->meta->make_immutable;

1;
