#!/bin/bash

# This script is intended to be mapped to a mouse button or keyboard key that will move the mouse immediately to one screen, or the other.

# Requires
# xdotool

eval $(xdotool getmouselocation --shell)

if [ $X -gt 1366 ]
then
    x=500
else
    x=2000
fi

xdotool mousemove $x 500

eval $(xdotool getmouselocation --shell)

xdotool windowfocus $WINDOW
