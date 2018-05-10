#!/usr/bin/env perl

use strict;
use diagnostics;
use warnings;
use File::Which;
use File::Which qw(which where);
use experimental qw(smartmatch switch);

my $num = 0;
my $res = 0;
my $not = 0;
my $respuesta = '';

	print "cuantos numeros? : ";
	chomp( $num = <STDIN> );
	
	while ( $num > $res ) {
		print "\nnota : ";
		chomp( $not = <STDIN> );
		$res++;
	}
		
		do {
			print "\nopcion 1 ";
			print "\nopcion 2 ";
			print "\nopcion 3 = salir\n";
			chomp( my $op = <STDIN> ); 
		
			given($op){
				when(1) {
					print "\nopcion 1 seleccionada\n";
				}
				when(2) {
				print "\nopcion 2 seleccionada\n";
				}
				when(3){
					print "\ndesea salir ? S/N\n";
					$respuesta = shift;
					chomp( $respuesta = <STDIN> );
					if ( $respuesta !~ /^[nsNS]+$/ ){
						print "\nerror ";
					}
				}
			default{ 
				print "\nno se selecciono opcion valida";
			}
		}
		
		}while!( $respuesta eq "S" || $respuesta eq "s" );
	
