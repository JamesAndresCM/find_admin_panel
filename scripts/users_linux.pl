#!/usr/bin/env perl
use strict;
use experimental 'smartmatch';

my $file = '/etc/passwd';

open my $fh, '<' , $file or die "failed to open file...";
my ($total, $normal_users, $nolog, @groups);

while (<$fh>) {
	$total++;
	$normal_users++ if m#/home#;
	$nolog++ if m#/[s]bin/(false|nologin)#;
	my $group = (split /:/)[3];
        push @groups, $group unless $group ~~ @groups;
}

print "Total users: $total\n";
print "normal users: $normal_users\n";
print "Total groups: " . scalar @groups . "\n";
print "Users without login: $nolog\n";
