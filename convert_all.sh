#!/bin/bash

for i in *PRN; do
    enscript -l --font=Courier7 $i -o - | ps2pdf - $i.pdf
done

for i in *pdf; do
    pdftk "$i" cat 2-end output "trimmed/$i" 
done
