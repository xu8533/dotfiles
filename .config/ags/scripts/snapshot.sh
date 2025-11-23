#!/usr/bin/env bash

outputDir="$HOME/图片/Screenshots/"
outputFile="截图_$(date +%Y-%m-%d_%H-%M-%S).png"
outputPath="$outputDir/$outputFile"
mkdir -p "$outputDir"

mode=${1:-area}

case "$mode" in
active)
    command="grimblast copysave active $outputPath"
    ;;
output)
    command="grimblast copysave output $outputPath"
    ;;
area)
    command="grimblast copysave area $outputPath"
    ;;
*)
    echo "错误选项: $mode"
    echo "使用方法: $0 {active|output|area}"
    exit 1
    ;;
esac

if eval "$command"; then
    recentFile=$(find "$outputDir" -name '截图_*.png' -printf '%T+ %p\n' | sort -r | head -n 1 | cut -d' ' -f2-)
    notify-send "Grimblast" "截图已保存." \
        -i video-x-generic \
        -a "Grimblast" \
        -t 7000 \
        -u normal \
        --action="scriptAction:-xdg-open $outputDir=Directory" \
        --action="scriptAction:-xdg-open $recentFile=View"
fi
