#!/usr/bin/bash

# CONFIGURE:
DIR="/some/dir/path"

# Change all the directories to 755 (-rwxr-xr-x):
find $DIR -type d -exec chmod 755 {} \;
# Change all the files to 644 (-rw-r--r--):
find $DIR -type f -exec chmod 644 {} \;
