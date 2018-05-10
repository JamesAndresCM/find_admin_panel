#!/bin/perl

use strict;

print "\nIngresa el primer numero : \n";
my $var1 = <STDIN>;

print "\nIngresa el segundo numero : \n";
my $var2 = <STDIN>;

my $total = $var1 + $var2;

chomp($var1);
chomp($var2);

print "\nEl total es : $total \n";
