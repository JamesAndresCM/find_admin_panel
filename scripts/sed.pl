#!/usr/bin/env perl

use strict;
use warnings;

#@ARGV = qw( archivo );
$^I = ".bak";

die "Uso: $0 file1 file2 ... fileN" if @ARGV < 1;

while(<>) {
	s/prueba/algo/g;
	print;
}
