#!/bin/sh
source ~/Documents/github/RandomWallpaper/color_scheme

VOLUME_MUTE=""
VOLUME_LOW=""
VOLUME_MID=""
VOLUME_HIGH=""

SOUND_LEVEL=$(amixer -M get Master | awk -F"[][]" '/%/ { print $2 }' | awk -F"%" 'BEGIN{tot=0; i=0} {i++; tot+=$1} END{printf("%s\n", tot/i) }')
MUTED=$(amixer get Master | awk ' /%/{print ($NF=="[off]" ? 1 : 0); exit;}')

out=$(echo "rdg" | bluetoothctl | cat | grep "# rdg")
bluetooth=${out:8:-10}

ICON=$VOLUME_MUTE
if [ "$MUTED" = "1" ]
then
    ICON="$VOLUME_MUTE"
else
    if [ "$SOUND_LEVEL" -lt 30 ]
    then
        ICON="$VOLUME_LOW"
    elif [ "$SOUND_LEVEL" -lt 60 ]
    then
        ICON="$VOLUME_MID"
    else
        ICON="$VOLUME_HIGH"
    fi
fi

if [ "$bluetooth" == "bluetooth" ]; then
    echo " $ICON $SOUND_LEVEL "
    echo "$SOUND_LEVEL"
else
    echo "  $bluetooth : $ICON $SOUND_LEVEL% "
    echo "$bluetooth $SOUND_LEVEL"
fi

# echo colors
if [ "$MUTED" = "1" ]
then
    echo $ERROR_COLOR
else
    if [ "$SOUND_LEVEL" -gt 100 ]; then
        echo $ERROR_COLOR
    elif [ "$bluetooth" != "bluetooth" ]; then
        echo $FOCUS
    fi
fi