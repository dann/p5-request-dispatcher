use inc::Module::Install;
name 'HTTP-Request-Dispatcher';
all_from 'lib/HTTP/Request/Dispatcher.pm';

requires 'Mouse';
requires 'HTTP::Router';
requires 'UNIVERSAL::require';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
