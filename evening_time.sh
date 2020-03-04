#!/bin/bash

# Requires
# sox/mplayer
# redshift
# xbacklight

xbacklight -set 25
redshift -O 4000
mplayer ~/Music/ambient/spaceship/spaceship3.m4a

