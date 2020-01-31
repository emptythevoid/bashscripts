#! /bin/bash

# This script combines all MTS files in the current directory and outputs a .m2ts file

# Requires
# ffmpeg

c=0

for file in *.MTS; do
	var[c++]="$file";
done

RESULT=""
for i in ${var[@]}; do
	RESULT="$RESULT"$i"|"
done

ffmpeg -i "concat:${RESULT::-1}" -c copy output.m2ts
