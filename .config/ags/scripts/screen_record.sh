#!/usr/bin/env bash
# Requires wf-recorder: https://github.com/ammen99/wf-recorder

# Get the default audio sink
defaultSink=$(pactl get-default-sink)
WF_RECORDER_OPTS="--audio=$defaultSink.monitor -c libx264rgb"
outputFile=""
outputDir=""

# Function to check if recording is active
checkRecording() {
    pgrep -f "wf-recorder" >/dev/null
}

# Function to start screen recording
startRecording() {
    if checkRecording; then
        echo "录屏中，请稍后!"
        exit 1
    fi

    target="$2"

    if [ "$target" == "screen" ]; then
        monitor_name="$3"
        outputDir="$4"
    elif [ "$target" == "region" ]; then
        outputDir="$3"
    else
        echo "使用方法: $0 start {screen <monitor_name> | region} <output_directory>"
        exit 1
    fi

    # Set a default output directory if not provided
    outputDir="${outputDir:-$HOME/视频}"

    # Expand ~ to $HOME if present in outputDir
    outputDir="${outputDir/#\~/$HOME}"

    # Ensure output directory exists
    if [ ! -d "$outputDir" ]; then
        mkdir -p "$outputDir"
        echo "创建目录: $outputDir"
    fi

    # Generate output filename and path
    outputFile="录屏_$(date +%Y-%m-%d_%H-%M-%S).mp4"
    outputPath="$outputDir/$outputFile"

    echo "目标: $target"
    echo "显示器: ${monitor_name:-N/A}"
    echo "输出目录: $outputDir"
    echo "输出文件: $outputPath"

    # Start screen recording
    if [ "$target" == "screen" ]; then
        if [ -z "$monitor_name" ]; then
            echo "错误: 录屏时需要指定显示器名称."
            exit 1
        fi

        monitor_info=$(hyprctl -j monitors | jq -r ".[] | select(.name == \"$monitor_name\")")
        if [ -z "$monitor_info" ]; then
            echo "错误: 未找到显示器 '$monitor_name'."
            exit 1
        fi

        w=$(echo "$monitor_info" | jq -r '.width')
        h=$(echo "$monitor_info" | jq -r '.height')
        scale=$(echo "$monitor_info" | jq -r '.scale')
        x=$(echo "$monitor_info" | jq -r '.x')
        y=$(echo "$monitor_info" | jq -r '.y')

        transform=$(echo "$monitor_info" | jq -r '.transform')
        rotation_filter=""

        if [ "$transform" -eq 1 ] || [ "$transform" -eq 3 ]; then
            scaled_width=$(awk "BEGIN { print $h / $scale }")
            scaled_height=$(awk "BEGIN { print $w / $scale }")
        else
            scaled_width=$(awk "BEGIN { print $w / $scale }")
            scaled_height=$(awk "BEGIN { print $h / $scale }")
        fi

        case "$transform" in
        1)
            rotation_filter="-F transpose=1"
            ;;
        3)
            rotation_filter="-F transpose=2"
            ;;
        esac

        wf-recorder $WF_RECORDER_OPTS $rotation_filter --geometry "${x},${y} ${scaled_width}x${scaled_height}" --file "$outputPath" &
    elif [ "$target" == "region" ]; then
        wf-recorder $WF_RECORDER_OPTS --geometry "$(slurp)" --file "$outputPath" &
    fi

    disown "$(jobs -p | tail -n 1)"
    echo "录屏开始. 录屏文件保存在$outputPath"
    echo "$outputPath" >/tmp/last_recording_path
}

# Function to stop screen recording
stopRecording() {
    if ! checkRecording; then
        echo "未发现正在录屏."
        exit 1
    fi

    pkill -SIGINT -f wf-recorder
    sleep 1 # Allow wf-recorder time to terminate before proceeding

    outputPath=$(cat /tmp/last_recording_path 2>/dev/null)

    if [ -z "$outputPath" ] || [ ! -f "$outputPath" ]; then
        notify-send "停止录屏" "未发现最近录屏文件." \
            -i video-x-generic \
            -a "Screen Recorder" \
            -t 10000
        exit 1
    fi

    notify-send "Recording stopped" "Saved to: $outputPath" \
        -i video-x-generic \
        -a "Screen Recorder" \
        -t 10000 \
        --action="scriptAction:-xdg-open $(dirname "$outputPath")=Open Directory" \
        --action="scriptAction:-xdg-open $outputPath=Play"
}

# Handle script arguments
case "$1" in
start)
    startRecording "$@"
    ;;
stop)
    stopRecording
    ;;
status)
    if checkRecording; then
        echo "录屏中"
    else
        echo "未录屏"
    fi
    ;;
*)
    echo "使用方法: $0 {start [screen <monitor_name> | region] <output_directory> | stop | status}"
    exit 1
    ;;
esac
