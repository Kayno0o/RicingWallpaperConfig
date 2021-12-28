#!/bin/bash

# if first arg
if [ "$1" == "blur" ]; then
    import -window root "~/Pictures/screen.png"
    convert ~/Pictures/screen.png -blur 0x8 ~/Pictures/screen.png
    i3lock -t -i "~/Pictures/screen.png" -u -e
elif [ "$1" == "screen" ]; then
    import -window root "~/Pictures/screen.png"
    i3lock -t -i "~/Pictures/screen.png" -u -e
elif [ "$1" == "random" ]; then
    file=$(ls ~/Pictures/Wallpapers/*.png | shuf -n1)
    i3lock -t -i $file -u -e
else
    i3lock -t -i "~/Pictures/Wallpapers/1188479.png" -u -e
fi
