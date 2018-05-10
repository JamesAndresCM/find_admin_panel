#!/usr/bin/env perl
use strict;
use Term::ANSIColor qw(:constants);

my $opt = $ARGV[0];
my $sec_param = $ARGV[1];

sub help {
	die 
	"Usage:
	 text to binary: $0 -t text
	 binary to text: $0 -b binary\n";

}

if ( $opt eq "-t" && $#ARGV ne 0 && $sec_param =~ /^[a-zA-Z-0-9 ]/ ){
	foreach (@ARGV){
			s/-t//;
	}
		my @packArr = unpack("(B8)*", "@ARGV\n");
		print GREEN "BINARY : ",RESET, "@packArr\n";	
}elsif ( $opt eq "-b" && $#ARGV ne 0 && $sec_param =~ /^[0-9]+$/ ){	
	foreach (@ARGV) {
		s/-b//;s/\s+//g;
	}
	my @packArr = pack("(B8)*", @ARGV);
	print GREEN "TEXT : ", RESET, "@packArr\n";
}else{
	help();
}
