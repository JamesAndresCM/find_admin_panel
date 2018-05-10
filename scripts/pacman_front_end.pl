#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use File::Copy;
use File::Which;
use File::Which qw(which where);
use experimental qw(smartmatch switch);

my $OP;
my $Err = "\nthis is not number....\n";
my $QUESTION = '';
my $PACKAGE;
my $MIRROR = "/etc/pacman.d/mirrorlist.pacnew";

sub is_numeric { 
        my ($exp) = @_;
	$exp =~ /^[0-9]+$/;   
}  
	
sub reflector {

	my $file = '/etc/pacman.d/mirrorlist';
	my $_file='/etc/pacman.d/mirrorlist.bak';
	my $pack = 'reflector';

	system("clear");
	print("please wait...\n");

	if(which $pack){
		if(-f $_file){
			unlink("$file");
			rename("$_file", "$file");
			copy("$file","$_file");
			system("reflector -l 10 --sort rate --save $file");
			system("pacman-optimize");
		}
		else{
			rename($file, $_file);
			system("reflector -l 10 --sort rate --save $file");
			system("pacman-optimize");
		}

	}
	else{
		
		system("pacman -S $pack --noconfirm 1> /dev/null");

		if(-f $_file ){
			unlink("$file");
			rename("$_file", "$file");
			copy("$file","$_file");
			system("reflector -l 10 --sort rate --save $file");
			system("pacman-optimize");
		}
		else{
			rename($file, $_file);
			system("reflector -l 10 --sort rate --save $file");
			system("pacman-optimize");
		}

      }
      system("read -p '\npress [Enter] to continue\n' && clear");


}

sub search {
   
	system("clear");
	print "\n****Move Up or Down for view all.. press q to quit**********\n";

	print "\nEntry name package for search : \n";

	$PACKAGE = shift;

	chomp($PACKAGE = <STDIN>);

	print "\n***********Coincidences********\n\n";

	if(`pacman -Ss $PACKAGE | wc -l` > 8 ){
    
		system("pacman -Ss $PACKAGE | less && clear");
   
	}

	else{
    
		system("pacman -Ss $PACKAGE && read -p '\npress [Enter] to continue\n' && clear");

	}
}






	if ( $< != 0 ) {
		print "This script must be run as root\n"; 
		exit (0);
	}

else{	
	do{
			
			do{
			print "\n***********************************\n";			
			print "\n1-Update ";
			print "\n2-Search Package";
			print "\n3-Install Package";
			print "\n4-Remove Package";
			print "\n5-Clean cache";
			print "\n6-Remove unnecessary dependencies";
			print "\n7-Info about installed package";
			print "\n8-Patch Mirrorlist";
			print "\n9-Search installed package";
			print "\n10-Optimize mirrorlist";
			print "\n11-Exit\n";
			print "\n*******Entry your option : *********\n\n";
		
			chomp($OP = <STDIN>);
		
				
		}while(!is_numeric($OP) && print system("read -p '\n$Err press [Enter] to continue\n' && clear"));
	
			
		given ($OP){
   				
				
			when (1) { 
				print "\n************Updating***********\n";
				system("pacman -Syu && read -p '\npress [Enter] to continue\n' && clear") 
				
			}
				
				
			when (2) { 
				&search
			        
			}
				
			when (3) {
			
				system("clear");
				print "\n********Entry name package for Install*********\n";
                        	$PACKAGE = shift;
                        	chomp($PACKAGE = <STDIN>);
				print "\n";
                        	system("pacman -S $PACKAGE && read -p '\npress [Enter] to continue\n' && clear")
			}
			
			when (4) {
				system("clear");
				print "\n**********Entry name package for delete**********\n";
                        	$PACKAGE = shift;
                       		chomp($PACKAGE = <STDIN>);
				print "\n";
      				system("pacman -R $PACKAGE && read -p '\npress [Enter] to continue\n' && clear")
							
			}
			
			when (5) {
				print "\n\n********Cleaning**********\n\n";
				system("pacman -Sc && read -p '\npress [Enter] to continue\n' && clear")
			
			}
			
			when (6) {
				print "\n\n********Deleting unnecessary dependencies**********\n\n";
				system("pacman -Rs `pacman -Qtdq` 2> /dev/null") 
			}
			
			when (7) {
				system("clear");
				print "\n*************Entry name package***********\n";
                        	$PACKAGE = shift;
                       		chomp($PACKAGE = <STDIN>);
				print "\n";
       				system("pacman -Qi $PACKAGE && read -p '\npress [Enter] to continue\n' && clear")  
			}
			
			when (8) {
				if ( -e $MIRROR ) {
					system("sed -i 's/#//' $MIRROR");
					unlink("/etc/pacman.d/mirrorlist") or die "\nError";
					rename($MIRROR, "/etc/pacman.d/mirrorlist") or die "\nError";
					print "\nMirrorlist OK!";
					system("read -p '\npress [Enter] to continue\n' && clear")
			
			}	
			else{
				print "\nFile not found";
				system("read -p '\npress [Enter] to continue\n' && clear")
					
			}
			
				
		}
			
				
		when (9) {
			system("clear");
			system("echo 'Total Packages installed :' `pacman -Q | wc -l` ");
                        print "\n*************Entry name package***********\n";
                        $PACKAGE = shift;
                        chomp($PACKAGE = <STDIN>);
			if(`pacman -Q |grep ^$PACKAGE | wc -l` > 8 ){
                            system("pacman -Ss $PACKAGE | less && clear");
		    }
		    else{
			    system("pacman -Q | grep ^$PACKAGE && read -p '\npress [Enter] to continue\n' && clear");
                        
		    }

		    print "\n";
                 	
				
	    }
			#when (10) {
			#system("clear");
			#if ( -e "/usr/bin/yaourt" ) {
			#print "\n************Updating***********\n";
                        #system("yaourt -Syyu --devel --aur && read -p '\npress to continue\n' && clear")
                        #}
			#else { 
			#	print "\nYaourt isn't installed....";
			#}
			#}
			
			
			when (10) {
				&reflector 
			}
			
			
			when (11) {
				print "\n*********************";
                                print "\nExit Y/N ?\n";
                                $QUESTION = shift;
                                chomp($QUESTION = <STDIN>);
				print "\n*********************\n";
				if( $QUESTION !~ /^[nyNY]+$/ ){
				       print system("read -p '\nError enter Y or N... press [Enter] to continue\n' && clear")
			       }
                               
		       	
		       }

				
			
		       default { print system("read -p '\nOption Invalid press [Enter] to continue\n' && clear") }
			
		
	       }

		
	
       }while!( $QUESTION eq "y" || $QUESTION eq "Y" );	
		
}			

