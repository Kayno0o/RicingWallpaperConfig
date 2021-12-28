#!/bin/sh
source ~/Documents/github/RandomWallpaper/color_scheme

# If ACPI was not installed, this probably is a battery-less computer.
ACPI_RES=$(acpi -b)
ACPI_CODE=$?
if [ $ACPI_CODE -eq 0 ]
then
    # Get essential information. Due to som bug with some versions of acpi it is
    # worth filtering the ACPI result from all lines containing "unavailable".
    BAT_LEVEL_ALL=$(echo "$ACPI_RES" | grep -v "unavailable" | grep -E -o "[0-9][0-9]?[0-9]?%")
    BAT_LEVEL=$(echo "$BAT_LEVEL_ALL" | awk -F"%" 'BEGIN{tot=0;i=0} {i++; tot+=$1} END{printf("%d%%\n", tot/i)}')
    TIME_LEFT=$(echo "$ACPI_RES" | grep -v "unavailable" | grep -E -o "[0-9]{2}:[0-9]{2}:[0-9]{2}")
    IS_CHARGING=$(echo "$ACPI_RES" | grep -v "unavailable" | awk '{ printf("%s\n", substr($3, 0, length($3)-1) ) }')

    # If there is no 'time left' information (when almost fully charged) we 
    # provide information ourselvs.
    if [ -z "$TIME_LEFT" ]
    then
        TIME_LEFT="00:00:00"
    fi

    # Print full text. The charging data.
    TIME_LEFT=$(echo $TIME_LEFT | awk '{ printf("%s\n", substr($1, 0, 5)) }')
    echo "  $BAT_LEVEL  $TIME_LEFT "

    # Print the short text.
    echo "BAT: $BAT_LEVEL"
    
    # Change the font color, depending on the situation.
    if [ "$IS_CHARGING" = "Charging" ]
    then
        # Charging yellow color.
        echo "$WARNING_COLOR"
    else
        if [ "${BAT_LEVEL%?}" -le 25 ]
        then
            # Battery very low. Red color.
            echo "$ERROR_COLOR"
        else
            echo "$GOOD_COLOR"
        fi
    fi
fi
