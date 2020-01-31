#!/bin/bash

# This script automatically trashes any image exported from Impress
# That is solid black (may do others)
# The black files will have a color space of "Gray" rather than "sRGB"

# Requires
# imagemagick

for file in *.jpg; do

    COLOR="$(identify -format %[colorspace] "$file")"
    if [ $COLOR == "Gray" ]; then
        echo "Gray detected in $file --moving to trash"
        gio trash "$file"
    fi

done
