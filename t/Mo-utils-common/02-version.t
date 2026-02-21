use strict;
use warnings;

use Mo::utils::common;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Mo::utils::common::VERSION, 0.02, 'Version.');
