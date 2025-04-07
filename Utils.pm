package Mo::utils::XML::Utils;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(check_percent);

our $VERSION = 0.01;

sub check_percent {
	my ($value, $key, $args_ar, $func, $error_value) = @_;

	foreach my $i (@{$args_ar}[1 .. 2]) {

		# Check percent sign.
		if ($i =~ m/^(\d+)(\%)?$/ms) {
			$i = $1;
			my $p = $2;
			if (! $p) {
				err "Parameter '$key' has bad $func percent (missing %).",
					'Value', $error_value,
				;
			}
		# Check percent number.
		} else {
			err "Parameter '$key' has bad $func percent.",
				'Value', $error_value,
			;
		}

		# Check percent value.
		if ($i > 100) {
			err "Parameter '$key' has bad $func percent.",
				'Value', $error_value,
			;
		}
	}

	return;
}

1;

__END__
