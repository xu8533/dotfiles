#!/usr/bin/env bash

# HYPRSHOT_DIR=$HOME/图片/Screenshots
screen_file="${HOME}图片/Screenshots/截屏_$(date +%Y-%m-%d_%H:%M:%S).png"

# 全屏，区域，预览等截屏
if [[ "$1" == "--full" ]]; then # 全屏截图，并保存到剪贴板
    # grim -t png -l 8 "$screen_file" | cliphist store
    grim -t png -l 8 "$screen_file" | wl-copy
    notify-send --icon=image "全屏截图已保存" "<font size=2 color=grey><b><i>$screen_file</b></i></font>"
elif [[ "$1" == "--region" ]]; then # 区域截图
    region=$(slurp -d | tr --delete "\n")
    grim -t png -l 8 -g "$region" "$screen_file" | cliphist store
    notify-send --icon=image "区域截图已保存" "<font size=2 color=grey><b><i>$screen_file</b></i></font>"
elif [[ "$1" == "--window" ]]; then # 窗口截图
    region=$(hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
    grim -t png -l 8 -g "$region" "$screen_file" | cliphist store
    notify-send --icon=image "窗口截图已保存" "<font size=2 color=grey><b><i>$screen_file</b></i></font>"
elif [[ "$1" == "--preview" ]]; then # 预览截图
    region=$(slurp -d | tr --delete "\n")
    grim -t png -l 0 -g "$region" - | cliphist store && cliphist list | head -n 1 | cliphist decode | imv -s full -w imv-preview -
fi
