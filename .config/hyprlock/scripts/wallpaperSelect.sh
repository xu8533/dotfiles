#!/usr/bin/env bash

# Wallpapers Path

if [[ -n $(caelestia wallpaper) ]]; then
    wallpaper=$(caelestia wallpaper)
elif [[ -n $(pidof swww-daemon) ]]; then
    wallpaper=$(swww query | awk -F: '{print $NF}')
fi

if [ -e "$HOME/.config/hyprlock/background" ]; then
    rm "$HOME/.config/hyprlock/background"
fi
ln -s "$wallpaper" "$HOME/.config/hyprlock/background"
