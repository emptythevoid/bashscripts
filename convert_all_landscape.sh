#!/bin/bash

for i in *PRN; do
    enscript -rl --font=Courier8 $i -o - | ps2pdf - $i.pdf
done

for i in *pdf; do
    pdftk "$i" cat 2-end output "trimmed/$i" 
done
