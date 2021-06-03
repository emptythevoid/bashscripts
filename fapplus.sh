#!/bin/bash

# A dirt simple downloader for fap.plus "get user" pages.
# Uses lynx to extract all the video links from a fap.plus getuser page
# and youtube-dl to download them into the current directory

# Requires lynx and youtube-dl

# Usage:  fapplus.sh <URL>

# fetch all links from page, search only the content links, and cut so only link remains. Save to list
lynx -dump -listonly $1 | grep fap.plus/content | cut -d '.' -f 2-10 > downloadlinks.txt

# show how many download links found
echo "Number of download links discovered: $(wc -l downloadlinks.txt | cut -d ' ' -f 1"

# feed the links to youtube-dl as a list and begin downloading
youtube-dl -a downloadlinks.txt

# do we need anything to remove the leading text that's tacked to the beginning of the filenames?
