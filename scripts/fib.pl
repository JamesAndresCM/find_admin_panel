#!/usr/bin/env perl

use warnings; 
use strict;

#declaracion de variables
my $x = 0;
my $y = 1;
my $z = 0;
my $cn;

#function regex
sub is_numeric {
	my ($exp) = @_;
	$exp =~ /^[0-9]+$/;
}

my $start = time();

#verifica que solo se ingrese un para
if ( @ARGV gt 1 ){
	print "solo un parametro\n";
	exit ();
	}
	
	#validacion del param
	elsif ( !is_numeric(@ARGV) || @ARGV eq "" ){
			print @_ , "no es un numero...\n";
			exit ();
		}
	else {
		#se asigna el parametro ingresado a var n
		my ($n) = @ARGV;

		for ($cn =1 ; $cn <= $n; $cn++) {
		   	$z = $x + $y;
		      	$x = $y;
	        	$y = $z;
	 	}
		#serie mientras se ingrese un valor
		#printf("$y\n");

		#numeros pares
		for (my $i = 0; $i < $y; $i++ ){
			if( $i % 2 == 0){
				print "$i\n";
			}
		}
 	}
	my $end = time();
	my $seg = $end - $start;

	#tiempo que demora el calculo
	print "$seg segundos..\n";
