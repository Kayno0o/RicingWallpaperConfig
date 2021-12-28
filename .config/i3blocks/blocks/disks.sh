#!/bin/bash
source ~/Documents/github/RandomWallpaper/color_scheme

DISK_USED=$(df -h $1 | awk '/\//{ printf("%4s", $3) }')
DISK_TOTAL=$(df -h $1 | awk '/\//{ printf("%4s", $2) }')
DISK_PERCENT=$(df -h $1 | awk '/\//{ printf("%d", $5) }')

if [ $DISK_TOTAL != "" ]; then
    echo "  $DISK_USED/$DISK_TOTAL $DISK_PERCENT% "
    echo $(df -h $1 | awk '/\//{ printf("%4s/%s", $3, $2) }')

    if [ "$DISK_PERCENT" -lt "50" ]
    then
        echo "$GOOD_COLOR"
    elif [ "$DISK_PERCENT" -lt "80" ]
    then
        echo "$WARNING_COLOR"
    else
        echo "$ERROR_COLOR"
    fi
fi