#!/usr/bin/env bash

HYPRSHOT_DIR=$HOME/图片/Screenshots/
screen_file=$HYPRSHOT_DIR/截屏_$(date +%Y-%m-%d_%H:%M:%S).png

# 全屏，区域，预览等截屏
if [[ "$1" == "--full" ]]; then # 全屏截图，并保存到剪贴板
	# grim -t png -l 8 "$screen_file" | cliphist store
	grim -t png -l 8 "$screen_file" | wl-copy
elif [[ "$1" == "--region" ]]; then # 区域截图
	region=$(slurp -d | tr --delete "\n")
	grim -t png -l 8 -g "$region" "$screen_file" | cliphist store
elif [[ "$1" == "--preview" ]]; then # 预览截图
	region=$(slurp -d | tr --delete "\n")
	grim -l 0 -g "$region" -t png - | cliphist store && cliphist list | head -n 1 | cliphist decode | imv -s full -w imv-preview -
fi
