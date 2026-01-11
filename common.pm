package Mo::utils::common;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use Readonly;
use Scalar::Util qw(blessed);

Readonly::Array our @EXPORT_OK => qw(check_object);

our $VERSION = 0.01;

sub check_object {
	my ($value, $class, $message, $message_params_ar) = @_;

	if (! blessed($value)) {
		my $err_message = sprintf $message, @{$message_params_ar};
		err $err_message,

			# Only, if value is scalar.
			(ref $value eq '') ? (
				'Value', $value,
			) : (),

			# Only if value is reference.
			(ref $value ne '') ? (
				'Reference', (ref $value),
			) : (),
	}

	if (! $value->isa($class)) {
		my $err_message = sprintf $message, @{$message_params_ar};
		err $err_message,
			'Reference', (ref $value),
		;
	}

	return;
}

1;

__END__
