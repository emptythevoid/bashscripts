# bashscripts
Collection of Linux Bash scripts I've created over the years

Table of Contents

adobe_flash_download.sh - downloads the most current Windows .MSI file of the Adobe Flashplayer installer (was used to deploy via group policy)

concat_mts.sh - script that concatenates all sequential MTS files in a directory into a single m2ts file.  (This was used because of a camera that segmented video due to filesize limits)

delete_black.sh - a script that looks at jpgs in the current directory and tries to identify if they have a black background (in this case, what imagemagick identifies as "Gray" - don't ask me why) and puts them in the trash.

open-url.sh - A script to help open .url files from Windows in a Linux web browser (to be added in the right-click context menu, for example)

openwithcustomcommand - This is intended to be placed inside a right-click context menu.  It accepts a file and then a dialog prompt appears asking to enter in a custom command to open the file with.  I believe I created this as a quick way to restore this behavior to the open file options in Ubuntu.

repairpdf.sh - a script I wrote that was used to repair a large collection of PDFs that wouldn't open in most PDF viewers (file type was "data" rather than "PDF version 1.4" or whatever).  It's a stupid fix, but it works.

