#!/bin/bash

# A dirt simple downloader for stuffer.db pages
# Uses lynx to extract all the video links from a fap.plus getuser page
# and youtube-dl to download them into the current directory

# This has only been tested on "model" pages
# This only works on one page at a time. If the model page has subpages for videos, youtube, etc, OR if there are multiple pages, you have to run this program for each (sub)page separately.

# Requires curl, lynx and wget

# Usage:  stufferdb.sh <URL>

# fetch all links from page, search only the content links, and cut so only link remains. Save to list

lynx -dump -listonly $1 | grep picture.php | cut -d '.' -f 2-10| cut -d '&' -f 1 > downloadlinks.txt

# read over the list
while read url
do 
    #echo $url
    
    # try to grab .mp4 URL first
    mp4link=$(curl -s $url | grep upload | grep .mp4 | cut -d '"' -f 2 | cut -d "&" -f 1)
    
    # if no mp4 was found, assume it's a picture and download it
    if [ -z "$mp4link" ]
    then
        #echo "var is empty. assuming picture"
    
        # get URLs of .jpgs. Grab the first result only, then cut it, save to variable
               
        jpglink=$(lynx -image_links -dump $url | grep -m 1 upload | cut -d '.' -f 2-10)
    
        if [[ $jpglink = *java* ]]
        then
            # format the link for wget, then download
            jlink=$(echo $jpglink | cut -d "'" -f 2)
            jpglink=$(echo "https://stufferdb.com/"$jlink)
            wget -nv $jpglink
        else
            # use the jpg link as-is
            wget -nv $jpglink
        fi

    else
        # assume we found an .mp4 link and download it with wget
        wget -nv $mp4link
fi
done < downloadlinks.txt




