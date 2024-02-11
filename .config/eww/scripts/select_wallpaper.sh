#!/usr/bin/env bash

file=$(zenity --file-selection --filename $HOME/图片/Wallpapers/)

if [[ $file == "" ]]; then
	exit 0
fi

~/.config/eww/scripts/material.py --image "$file"
