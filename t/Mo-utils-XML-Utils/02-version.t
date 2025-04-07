use strict;
use warnings;

use Mo::utils::XML::Utils;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Mo::utils::XML::Utils::VERSION, 0.01, 'Version.');
