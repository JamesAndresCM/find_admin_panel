#!/usr/bin/perl

use strict;
use warnings;
use Net::Ping;

my $p = Net::Ping->new("icmp", 2);

print "entry ip\n";
my $ip = <STDIN>;

my $regex = qr/^(?!(\.))(\.?(\d{1,3})(?(?{$^N > 255})(*FAIL))){4}$/;

if($ip =~ $regex){

	if ($p->ping($ip)){
		print "yes\n";
		print "$ip";
	}
		else{
			print "no\n";
		}
	}
	else{
		print "no existe la ip : $ip";
	}
