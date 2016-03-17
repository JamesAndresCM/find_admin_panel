#!/usr/bin/perl

use strict;
use warnings;
use HTTP::Request;
use LWP::UserAgent;


print("entry URL to scan (FORMAT! -----> http://www.site.com/)\n");
   
    my $url=<STDIN>;
    chomp($url);
    
    if( $url eq "" ){
	  print("value null....\n");
	  exit;
    }

    my $regex = qr/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/; 
    
    
    if($url =~ $regex ) { 
	    #$host = "http://$host/";
	    #if be used 'open' with some file maybe will be more interesting http://perldoc.perl.org/functions/open.html 
	    my @admin_panel = ("admin.php","admin/login.php", "admin/");


	    foreach my $search(@admin_panel){

		    my $url_ = $url.$search;
		    my $request = HTTP::Request->new(GET=>$url_);
		    my $useragent = LWP::UserAgent->new();

		    my $response = $useragent->request($request);
		    if ($response->is_success){
			            print("Admin Panel Found! : $url_\n");
				            exit;
				    }
				    else {
					            print("Searching.... : $url$search\n");
					    }

    			}
    }
    else {
	    print("$url the url is not a valid format..\n");
	    exit;

    }
    
