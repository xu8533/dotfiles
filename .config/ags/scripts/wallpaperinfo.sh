#!/usr/bin/env bash

wallpaper_server="swww-daemon"

if pgrep $wallpaper_server >/dev/null; then
    swww query | awk -F: '{print $NF}'
else
    echo $wallpaper_server 未启动
fi
