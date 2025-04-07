use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Mo::utils::XML::Utils qw(check_percent);
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Test.
my $ret = check_percent('20%', 'key');
is($ret, undef, 'Get right percent value (20%).');

# Test.
eval {
	check_percent('20', 'key');
};
is($EVAL_ERROR, "Parameter 'key' has bad percent value (missing %).\n",
	"Parameter 'key' has bad value percent (missing %) (20).");
clean();

# Test.
eval {
	check_percent('bad', 'key');
};
is($EVAL_ERROR, "Parameter 'key' has bad percent value.\n",
	"Parameter 'key' has bad value percent (bad).");
clean();

# Test.
eval {
	check_percent('101%', 'key');
};
is($EVAL_ERROR, "Parameter 'key' has bad percent value.\n",
	"Parameter 'key' has bad value percent (101%).");
clean();
