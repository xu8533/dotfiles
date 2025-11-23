#!/usr/bin/env bash

DEFAULT_INTERVAL=300 # In seconds

if [ $# -lt 1 ] || [ ! -d "$1" ]; then
    printf "用法:\n\t\e[1m%s\e[0m \e[4m目录\e[0m [\e[4m间隔\e[0m]\n" "$0"
    printf "\t随机更换背景图\n"
    exit 1
fi

# See swww-img(1)
RESIZE_TYPE="fit"
export SWWW_TRANSITION_FPS="${SWWW_TRANSITION_FPS:-60}"
export SWWW_TRANSITION_STEP="${SWWW_TRANSITION_STEP:-2}"

while true; do
    find "$1" -type f |
        while read -r img; do
            echo "$(</dev/urandom tr -dc a-zA-Z0-9 | head -c 8):$img"
        done |
        sort -n | cut -d':' -f2- |
        while read -r img; do
            swww img --resize="$RESIZE_TYPE" "$img"
            sleep "${2:-$DEFAULT_INTERVAL}"
        done
done
