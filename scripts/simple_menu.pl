#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;
use experimental qw(smartmatch switch);

my $NUMBER_ONE;
my $NUMBER_TWO;
my $OP;
my $Err = "\nthis is not number....\n";
my $QUESTION = '';

sub is_numeric { 
        my ($exp) = @_;
	#$exp =~ /^-?(?:[\d.-]+e[\d.+-]+|\d[\d.-]*\^[\d.-]+|[\d.-]+)$/;
	$exp =~ /^[0-9]+$/;   
}  

sub compare_numbers {
do{
	print "\nEntry your first number : \n";
	$NUMBER_ONE = <STDIN>;
	}while(!is_numeric($NUMBER_ONE) && print "$Err" );
		do{
		print "\nEntry your second number : \n";
                $NUMBER_TWO = <STDIN>;
			}while(!is_numeric($NUMBER_TWO) && print "$Err" );

if ( $NUMBER_ONE eq $NUMBER_TWO ) {
	print "numbers are equals\n";	
	}	
		elsif ( $NUMBER_ONE lt $NUMBER_TWO ){
				print $NUMBER_ONE . "is less than " . $NUMBER_TWO;
		}
			elsif ( $NUMBER_ONE > $NUMBER_TWO ){
                       		print $NUMBER_ONE . " is most great than " . $NUMBER_TWO;
                	}

}
	
	
	do{
			
			do{
			print "\n***********************************\n";			
			print "\n1-Tiempo ";
			print "\n2-Compare numbers ";
			print "\n3-Exit \n";
			
			print "\n*******Entry your option : *******\n\n";
		
			$OP = <STDIN>;
		
				}while(!is_numeric($OP) && print "$Err" );
	
			given ($OP){
   				when (1) { system("clear && date") }
				when (2) { compare_numbers() }
				when (3) {
				print "\nExit Y/N ?\n";
                		$QUESTION = shift;
           			chomp($QUESTION = <STDIN>);
				if( $QUESTION !~ /^[nyNY]+$/ ){
					print "\nError \n";
					}
				}
				default { print "\nOption Invalid ....\n" }
			}

		}while!( $QUESTION eq "y" || $QUESTION eq "Y" );	
					
chomp($NUMBER_ONE);
chomp($NUMBER_TWO);
chomp($OP);
print "\ncase : $OP\n";
