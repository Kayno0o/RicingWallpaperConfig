#!/bin/bash
source ~/Documents/github/RandomWallpaper/color_scheme

CPU_USAGE=$(mpstat 1 1 | awk '/Average:/ {printf("%s\n", $(NF-9))}')

echo "  $CPU_USAGE% "
echo "$CPU_USAGE"

CPU_USAGE_INT=$(echo "$CPU_USAGE" | awk '{ printf("%d\n"), $1 }')

if [ "$CPU_USAGE_INT" -gt 50 ]
then
    echo "$WARNING_COLOR"
elif [ "$CPU_USAGE_INT" -gt 80 ]
then
    echo "$ERROR_COLOR"
fi