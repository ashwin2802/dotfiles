#!/usr/bin/env bash

WIDTH=1920
HEIGHT=1080
XTARGET=`expr $WIDTH + 25`
YTARGET=`expr $HEIGHT - 250`

# Launch the snapshot gui
flameshot gui && sleep 0.07

# Save the current mouse location
eval $(xdotool getmouselocation --shell)

# Move the mouse to the top left corner and drag it to to the right bottom corner
xdotool mousemove 0 0
xdotool mousedown 1 # pres and hold
xdotool mousemove ${WIDTH} ${HEIGHT}
xdotool mouseup 1 # release click
sleep 0.2

# Click on pen tool
xdotool mousemove ${XTARGET} ${YTARGET} click 1

# Restore mouse to previous location
xdotool mousemove ${X} ${Y}%
