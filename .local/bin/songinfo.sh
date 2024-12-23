#!/usr/bin/env bash

music_dir="/media/数据/音乐"
previewdir="$HOME/.ncmpcpp/previews"
filename="$(mpc --format "$music_dir"/%file% current)"
previewname="$previewdir/$(mpc --format %album% current | base64).png"

[ -e "$previewname" ] || ffmpeg -y -i "$filename" -an -vf scale=128:128 "$previewname" >/dev/null 2>&1

notify-send -r 27072 "正在播放" "$(mpc --format '%title% \n%artist% - %album%' current)" -i "$previewname"
