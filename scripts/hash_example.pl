#!/usr/bin/env perl


my %ciudades = ( 
		'curico' => 1 ,
		'santiago' => 2,
		'arica' => 3,
		'concepcion' => 4
		);

	print "@{[%ciudades]}\n";

	foreach my $llave (keys %ciudades){
		print "$llave = $ciudades{$llave}\n";
	}

	#ordenados
	foreach  my $llave (sort keys %ciudades){
		print "\n$llave = $ciudades{$llave}\n";
	}




