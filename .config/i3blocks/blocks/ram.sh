#!/bin/bash
source ~/Documents/github/RandomWallpaper/color_scheme

RAM_USED=$(free -h | awk '/Mem:/ { printf("%5s", $3) }')
RAM_TOTAL=$(free -h | awk '/Mem:/ { printf("%5s", $2) }')
RAM_PERCENT=$(~/Documents/scripts/calc.sh "parseInt((parseFloat('$RAM_USED') * 100) / parseFloat('$RAM_TOTAL'))")

echo "  $RAM_USED/$RAM_TOTAL $RAM_PERCENT% "
echo "$RAM_USED/$RAM_TOTAL"

if [ "$RAM_PERCENT" -lt "50" ]; then
    echo $GOOD_COLOR
elif [ "$RAM_PERCENT" -lt "80" ]; then
    echo $WARNING_COLOR
else
    echo $ERROR_COLOR
fi