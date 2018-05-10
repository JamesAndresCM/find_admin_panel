#!/usr/bin/env perl

my @var = (2,0,6,9,0,8,11,10,5,0);

foreach my $i (0 .. $#var){
	if ( "$var[$i]" =~ /^0+$/ ){
	print "$i: element : $var[$i]\n";
	}
}
