# bashscripts
Collection of Linux Bash scripts I've created over the years

Table of Contents

adobe_flash_download.sh - downloads the most current Windows .MSI file of the Adobe Flashplayer installer (was used to deploy via group policy)

concat_mts.sh - script that concatenates all sequential MTS files in a directory into a single m2ts file.  (This was used because of a camera that segmented video due to filesize limits)

delete_black.sh - a script that looks at jpgs in the current directory and tries to identify if they have a black background (in this case, what imagemagick identifies as "Gray" - don't ask me why) and puts them in the trash.

repairpdf.sh - a script I wrote that was used to repair a large collection of PDFs that wouldn't open in most PDF viewers (file type was "data" rather than "PDF version 1.4" or whatever).  It's a stupid fix, but it works.

