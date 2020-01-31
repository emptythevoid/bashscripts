#!/bin/bash

# Takes all .mp4 files in current directory and re-encodes them optimized for PiWiGo

for file in *.mp4; do

    HandBrakeCLI --optimize --encoder x264 --x264-profile high -i $file -o "convert"_$file

done
