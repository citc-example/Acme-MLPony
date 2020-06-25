#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 1;
use Path::Tiny qw( path );
use FindBin;

unlike(
    path($FindBin::Bin)->parent->child("lib","Acme","MLPony","Util.pm")->slurp,
    qr/(Snooty|Hipster|Goth)/,
    q{Don't allow any of Fluttershy's personas from "Fake It 'Til You Make It"},
)

