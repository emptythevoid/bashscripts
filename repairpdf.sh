#! /bin/bash

# This script was created to repair PDF files that did not open properly.

# Requires:
# pdftops
# ps2pdf

# convert all PDF files to .ps files
for file in *.PDF; do
	pdftops "$file";
done

# convert all .ps files back to PDF files (properly)
for file in *.ps; do
	ps2pdf "$file";
done

# cleanup
rm ./*.PDF
rm ./*.ps
