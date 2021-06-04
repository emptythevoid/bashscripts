#!/bin/bash

# A dirt simple downloader for stuffer.db pages
# Uses lynx to extract all the video links from a fap.plus getuser page
# and youtube-dl to download them into the current directory

# This has only been tested on "model" pages
# This only works on one page at a time. If the model page has subpages for videos, youtube, etc, OR if there are multiple pages, you have to run this program for each (sub)page separately.

# to do - the URL provided should probably be converted to relative in *all* cases, instead of specifically handling it when that's what's returned from lynx

# Requires curl, lynx and wget

# Usage:  stufferdb.sh <URL>

# fetch all links from page, search only the content links, and cut so only link remains. Save to list
lynx -dump -listonly $1 | grep picture.php | cut -d '.' -f 2-10| cut -d '&' -f 1 > downloadlinks.txt

# read over the list. downloadlinks.txt is directed in at the bottom of this while loop
while read url
do 

    echo 'Working on page: '$url
    
    # try to grab .mp4 URL first
    mp4link=$(curl -s $url | grep upload | grep .mp4 | cut -d '"' -f 2 | cut -d "&" -f 1)
    
    # if no mp4 was found, assume it's a picture (.jpg, .gif, .png, .etc) and download it
    if [ -z "$mp4link" ]
    then
    
        # get URLs of images. Grab the first result only, then cut it, save to variable      
        jpglink=$(lynx -image_links -dump $url | grep -m 1 upload | cut -d '.' -f 2-10)
        
    
        # handle where the image link returned is relative or otherwise breaks wget
        if [[ $jpglink = /upload* ]]
        then
            #echo "Working around scheme problem"
            #echo "we're getting stuck on the URL:"
            #echo $url
            
            # redo the way lynx and grep grab the URL
            #path=$(lynx -image_links -dump $url | grep javascript | tail -n1 | cut -d "'" -f 2)
            path=$(lynx -image_links -dump $url | grep stufferdb.com/upload/ | cut -d '.' -f 2-10)
            #jpglink=$(echo 'https://stufferdb.com'$path)
            jpglink=$(echo $path)
            
            # check if path is empty
            if [ -z "$jpglink" ]
            then
                # grep for stufferdb.com/_data/i/upload and choose first returned option (hopefully largest)
                path=$(lynx -image_links -dump $url | grep -m 1 stufferdb.com/_data/i/upload | cut -d '.' -f 2-10)
                jpglink=$(echo $path)
            #else
            #    echo "Both fixes didn't seem to work" >> /dev/null
            fi
            
            #echo "USING WORKAROUND PATH: "$jpglink
            
            
        #else
        #    echo "no problem" >> /dev/null
        fi
        
    
        if [[ $jpglink = *java* ]]
        then
            # format the link for wget, then download
            jlink=$(echo $jpglink | cut -d "'" -f 2)
            echo $jlink
            jpglink=$(echo 'https://stufferdb.com/'$jlink)
            echo $jpglink
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




