use inc::Module::Install;
name 'Request-Dispatcher';
all_from 'lib/Request/Dispatcher.pm';

requires $_ for (qw/ /);

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
