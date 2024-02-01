#!/usr/bin/env bash
hyprpicker --format hex | head -c -1 | wl-copy
convert -size 100x100 xc:$(wl-paste) /tmp/color.png
dunstify --icon=/tmp/color.png "$(wl-paste)" "已经复制到剪切板"
