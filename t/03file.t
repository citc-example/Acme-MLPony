#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 1;

use File::Temp qw( tempdir );
use Path::Tiny qw( path );

use Acme::MLPony qw(pony_file);

my $dir = tempdir( CLEANUP => 1 );
my $file = path($dir, "hi.pl");
$file->spew_raw(<<'SCRIPT');
#!/usr/bin/perl

use strict;
use warnings;

print "Hello, World.\n";
SCRIPT

pony_file($file);

is($file->slurp_raw, <<'SCRIPT');
#!/usr/bin/perl
use Acme::MLPony::Friendship;
Ahuizotl, Capper, Ahuizotl, Capper, Big McIntosh, Babs Seed,
Big McIntosh, Applejack, Barley Barrel, Babs Seed, Apple Rose,
Ahuizotl, Big McIntosh, Applejack, Big McIntosh, Auntie Applesauce,
Big McIntosh, Apple Rose, Barley Barrel, Bulk Biceps, Barley Barrel,
Applejack, Big McIntosh, Auntie Applesauce, Applejack, Captain Celaeno,
Ahuizotl, Capper, Big McIntosh, Babs Seed, Big McIntosh, Applejack,
Barley Barrel, Babs Seed, Apple Rose, Ahuizotl, Big McIntosh,
Big McIntosh, Barley Barrel, Apple Bloom, Big McIntosh, Apple Rose,
Barley Barrel, Cheerilee, Barley Barrel, Bulk Biceps, Barley Barrel,
Cheerilee, Barley Barrel, Big McIntosh, Big McIntosh, Applejack,
Applejack, Captain Celaeno, Ahuizotl, Capper, Ahuizotl, Capper,
Big McIntosh, Ahuizotl, Big McIntosh, Apple Rose, Barley Barrel,
Bulk Biceps, Barley Barrel, Cheerilee, Big McIntosh, Auntie Applesauce,
Apple Rose, Ahuizotl, Apple Rose, Apple Rose, Auntie Applesauce,
Braeburn, Barley Barrel, Babs Seed, Barley Barrel, Chancellor Neighsay,
Barley Barrel, Chancellor Neighsay, Barley Barrel, Chrysalis,
Apple Rose, Chancellor Neighsay, Apple Rose, Ahuizotl, Babs Seed,
Big McIntosh, Barley Barrel, Chrysalis, Big McIntosh, Apple Rose,
Barley Barrel, Chancellor Neighsay, Barley Barrel, Auntie Applesauce,
Apple Rose, Cheerilee, Babs Seed, Chancellor Neighsay, Barley Barrel,
Cheerilee, Apple Rose, Apple Rose, Applejack, Captain Celaeno,
Ahuizotl, Capper
SCRIPT