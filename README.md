# bashscripts
Collection of Linux Bash scripts I've created over the years

Table of Contents

adobe_flash_download.sh - downloads the most current Windows .MSI file of the Adobe Flashplayer installer (was used to deploy via group policy)

checkifremovable.sh - PoC to check (via lsblk) if a drive specified (/dev/sdb, for example) is removeable or not.  This was intended to be used as part of a sanity check for dd so that it would warn you if you were trying to write an image to a drive that wasn't removable (similar to how Etcher does).

concat_mts.sh - script that concatenates all sequential MTS files in a directory into a single m2ts file.  (This was used because of a camera that segmented video due to filesize limits)

convert_all.sh - converts all .PRN files (files designed to be sent to an impact printer) and formats them into PDF files (portrait)

convert_all_landscape.sh - same as convert_all.sh, but is designed for PRN files intended to be printed "landscape."

delete_black.sh - a script that looks at jpgs in the current directory and tries to identify if they have a black background (in this case, what imagemagick identifies as "Gray" - don't ask me why) and puts them in the trash.

evening_time.sh - I found that after I had a baby, after he went to sleep for the night, I needed to unwind at my computer, and I found I kept entering in these commands.

fapplus.sh - A stupid simple extractor for "getuser" pages on fap.plus.  Extracts all content links from the page and has youtube-dl download them.

ldx-extractor - An overly complicated collection of bash scripts that allows capture of the output from an Cholestech LDX machine to a text file (and look flashy doing it).  Requires a serial-to-USB cable, figlet, lolcat, entr.  Intended to be used in a mass event, it allows the user to enter a patient name before each capture, so the output file shows who owns which reading. Place all files in the same directory and run sudo start-v2.sh

open-url.sh - A script to help open .url files from Windows in a Linux web browser (to be added in the right-click context menu, for example)

openwithcustomcommand - This is intended to be placed inside a right-click context menu.  It accepts a file and then a dialog prompt appears asking to enter in a custom command to open the file with.  I believe I created this as a quick way to restore this behavior to the open file options in Ubuntu.

repairpdf.sh - a script I wrote that was used to repair a large collection of PDFs that wouldn't open in most PDF viewers (file type was "data" rather than "PDF version 1.4" or whatever).  It's a stupid fix, but it works.

re-encode_video_piwigo.sh - Automatically re-encode all videos in current directory using handbrake to be formatted for easy playback in piwigo, per their documentation.

stufferdb.sh - A basic downloader for pages on stufferdb.com, using curl, linx and wget.  It's only been tested on 'models' pages.  If the model page has subpages (for videos/youtube/etc) or if there are multiple pages, you will have to re-run this script for each page separately.  This could likely be re-worked to perform on other Piwigo-based sites.

switch-screens.sh - This causes the mouse to move from one screen to another instantly.  This was intended to be used with EasyStroke to map to a button on my trackball to instantly switch mouse focus from one screen to the other.
