#!/usr/bin/perl

use strict;
use warnings;
use HTTP::Request;
use LWP::UserAgent;
use Term::ANSIColor qw(:constants);



    my $params;
    $params = @ARGV;
    chomp($params);
    
    if( $params ne 2 ){
	  print("Usage : www.site.com + PATH_TO_WORDLIST\n");
	  print("Example : www.example.com /home/JhonDoe/rockyou.txt\n");
	  exit;
    }
print RED,"";
print  <<EOT;
0MdKMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0OMd
EOT
print GREEN,"\t ****FIND  ADMIN PANEL****\n",RESET;
print RED,"";
print <<EOT;
0MxcxWMMMMMNXXNMMMMMMMMMMMMMMMNXXNMMMMMWkcKMd
EOT

    	#my $regex = qr/^(?:(https|http):\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/; 
   	#my $regex = qr/^(?:(ftp|http|https):\/\/)?(?:[\w-]+\.)+[a-z]{3,6}$/;	
    	my $regex = qr/(^|\s)((https?:\/\/)?[\w-]+(\.[\w-]+)+\.?(:\d+)?(\/\S*)?)/;
	my $reg_fl = qr/\.txt$/i;
    
    if($ARGV[0] =~ $regex ) { 

	    my $filename = $ARGV[1];
	    
	    if ($filename =~ $reg_fl){
		if(open(my $fh, '<', $filename)){
			while (my $row = <$fh>){
	
			chomp $row;

	    foreach my $search($row){

		
		    my $params_ = "http://".$ARGV[0]."/".$search;
		    my $request = HTTP::Request->new(GET=>$params_);
		    my $useragent = LWP::UserAgent->new();

		    my $response = $useragent->request($request);
			if ($response->is_success){
				print(WHITE,"\n*****ADMIN PANEL FOUND!***** : ",RESET);
				print (GREEN,"$params_\n",RESET);
				exit;
			}
			else {
				print(GREEN,"\nSearching.... : $ARGV[0]/$search\n",RESET);
			}
	    	}


           }
                    }
              } else{
                      print(WHITE,"$filename IS NOT A VALID TXT FILE...\n",RESET);
              }
	    
    }
    else {
	    print(WHITE,"$ARGV[0] IS NOT A VALID URL..\n",RESET);
	    exit;

    }

    
