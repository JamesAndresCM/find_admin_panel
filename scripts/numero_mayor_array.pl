#!/usr/bin/env perl

#retorna numero mayor array
my @data = (100, 73,20, 2, 0 ,4, 236, 0, 8, 15, 4);

my $max = $data;
$max= $_>$max ? $_ : $max foreach (@data);

print $max, "\n"
