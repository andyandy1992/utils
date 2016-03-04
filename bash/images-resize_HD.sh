#!/usr/bin/bash

# This script can be used to reduce the size of images. This scales them up to HD size (1920x1080pixels), ignoring rotation and only shrinking larger files.
# By default, this overwrites the original image.
# REQUIREMENTS: sudo apt-get install imagemagick

# CONFIGURE:
#Find *.jpg with more than 1920p high or wide
find "/some/root/path" -iname "*.jpg" -type f -not -path './some/excluded/files/*' -not -path './some/more/excluded/files/*'  -exec identify -format '%w %h %i' '{}' \; | awk '$1>1920 || $2>1920' &> /tmp/Huge.txt

# MAIN PROGRAM:
#Ignore Rotation
cat /tmp/Huge.txt | while read line; do
    WIDTH=`awk '{print $1}' <<< "$line"`
    HEIGHT=`awk '{print $2}' <<< "$line"`
    IMAGE=`sed s:"^[0-9]* [0-9]* "::g <<< "$line"`     # need to remove pixel information
    if [[ $WIDTH -gt $HEIGHT ]]; then
        echo "Width bigger"
        convert -resize '1920x1080>' "$IMAGE" "$IMAGE" # >:="only shrink larger" (following the imagemagick doc: http://www.imagemagick.org/script/command-line-processing.php#geometry)
                                                       # and we need to quote it to prevent bash intepreting it as a file director.
                                                       # changing > to ! forces image size to be exactly as specified.
        # convert -resize '1920x1080>' $IMAGE $(echo $IMAGE | sed 's/.jpg$/-resized.jpg/')
    else echo "Height bigger"
        convert -resize '1080x1920>' "$IMAGE" "$IMAGE"
        # convert -resize '1080x1920>' $IMAGE $(echo $IMAGE | sed 's/.jpg$/-resized.jpg/')
    fi
done
