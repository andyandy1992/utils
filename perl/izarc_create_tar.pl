#!/usr/bin/perl
use warnings;
use strict;
use Time::Piece;

my $Movedir = "/tmp/Movedir/";                      # Destination folder for zip
my $FolderToCompressName = "FolderToCompressName";  # Folder name to be compress
my $Time = localtime->strftime('%Y-%m-%d_%H%M%S');  # Current Date/Time
my $FolderPath = "/tmp/FolderPath";                 # Location where "FolderToCompressName" is

system("ls /tmp/Movedir");  # List contents of destination (intially yields" empty)

system("/usr/bin/zip", "$Movedir/$FolderToCompressName-$Time.zip", "$FolderPath/$FolderToCompressName");  # Run operating system command

system("ls /tmp/Movedir");  # List contents of destination (now yields something like "FolderToCompressName-2018-06-17_182741.zip")


use warnings;
use strict;
use Time::Piece;

my $Movedir = "C:\\Users\\swathore\\Desktop\\Perl";                # Destination folder for zip
my $FolderToCompressName = "New folder";                           # Folder name to be compress
my $Time = localtime->strftime('%Y-%m-%d_%H%M%S');                 # Current Date/Time
my $FolderPath = "C:\\Users\\swathore\\Documents\\OPTEGRA\\Perl";  # Location where "FolderToCompressName" is

system("C:\\Program Files (x86)\\IZArc\\izarcc", "-a", "-r", "-p", "-cx", "$Movedir\\$FolderToCompressName-$Time.zip", "$FolderPath\\$FolderToCompressName");  # Run operating system command
# If the above doesn't work this might:
# system("C:\\Program Files (x86)\\IZArc\\izarcc -a -r -p -cx", "$Movedir\\$FolderToCompressName-$Time.zip", "$FolderPath\\$FolderToCompressName");  # Run operating system command
