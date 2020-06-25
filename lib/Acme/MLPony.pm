package Acme::MLPony;

# ABSTRACT: Write Perl code with My Little Ponies

use strict;
use warnings;

use base qw(Exporter);
use Path::Tiny qw( path );
use Fatal qw(close);

use Acme::MLPony::Util qw( pony );

our @EXPORT_OK = qw( pony_file );

sub pony_file {
    my $path = path(shift);

    # read in the entire of the file
    my $data = $path->slurp_raw;

    my $shebang;
    if ($data =~ s/^(#!.*)//) {
        $shebang = $1;
    }

    # write it out again
    my $out = $path->openw_raw;
    print $out $shebang, "\n" if $shebang;
    print $out "use Acme::MLPony::Friendship;\n";
    print $out pony($data);
    close $out;
}

1;
