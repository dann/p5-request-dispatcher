use Test::Dependencies
	exclude => [qw/Test::Dependencies Test::Base Test::Perl::Critic Request::Dispatcher/],
	style   => 'light';
ok_dependencies();
