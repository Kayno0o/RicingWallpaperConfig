#!/bin/bash

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo "Usage: $0 [OPTION]"
    echo "By default, the script will take a full screenshot."
    echo "Options:"
    echo "  -h, --help    Show this help"
    echo "  -s, --select  Take a selection screenshot"
    exit 0
elif [ "$1" == "-s" ] || [ "$1" == "--select" ]; then
    file_path="~/Pictures/screenshots/$(date +%Y-%m-%d-%H-%M-%S).png"
    import $file_path
    xclip -selection clipboard -t image/png -i $file_path
    exit 0
else
    file_path="~/Pictures/screenshots/$(date +%Y-%m-%d-%H-%M-%S).png"
    import -window root $file_path
    xclip -selection clipboard -t image/png -i $file_path
    exit 0
fi
