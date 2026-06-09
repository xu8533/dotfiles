#!/usr/bin/env bash

DMENU="rofi -dmenu -i"
VIDEO="${HOME}/视频"
AUDIO="${HOME}/音乐"
recordid="/tmp/record.pid"

function getInputAudio() {
    description=$(pactl -f json list | jq -r '[.sinks[], .sources[]] [].description' | $DMENU -p "输入音源" -theme-str 'window {width: 40%;} listview {lines: 8;}')
    pactl -f json list | jq -r '[.sinks[], .sources[]] [] | select(.description == $DESCRIPTION) | .name' --arg DESCRIPTION "$description"
}

function getResolution() {
    xrandr | grep "*" | awk '{print $1}'
}

function audioVideo() {
    filename="$VIDEO/video-$(date '+%y%m%d-%H%M-%S').mp4"
    dimensions=$(getResolution)
    audio=$(getInputAudio)

    if [ -n "$audio" ]; then
        notify-send "开始录制视频" ":\n视频启用\n音频启用"
        ffmpeg -y -f x11grab -framerate 30 -s "$dimensions" \
            -i :0.0 -f pulse -i "$audio" -ac 1 \
            -c:v libx264 -pix_fmt yuv420p -preset veryfast -q:v 1 \
            -c:a aac "$filename" &

        echo $! >$recordid
    fi
}

function video() {
    filename="$VIDEO/video-$(date '+%y%m%d-%H%M-%S').mp4"
    dimensions=$(getResolution)

    notify-send "开始录制视频" ":\n视频启用\n音频禁用"
    # notify-send "Start Recording" "With:\nVideo On\nAudio Off"
    ffmpeg -y -f x11grab -framerate 30 -s "$dimensions" \
        -i :0.0 -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 \
        -c:v libx264 -pix_fmt yuv420p -preset veryfast -q:v 1 "$filename" &

    echo $! >$recordid
}

function audio() {
    filename="$AUDIO/audio-$(date '+%y%m%d-%H%M-%S').mp3"
    audio=$(getInputAudio)

    if [ -n "$audio" ]; then
        notify-send "开始录制音频" ":\n视频禁用\n音频启用"
        ffmpeg -f pulse -i "$audio" -ac 1 -acodec libmp3lame -ab 128k "$filename" &

        echo $! >$recordid
    fi
}

function stream() {
    output=$2
    platform=$1
    dimensions=$(getResolution)
    audio=$(getInputAudio)

    if [ -n "$audio" ]; then
        notify-send "开始推流 $platform" ":\n视频启用\n音频启用"
        ffmpeg -y -f x11grab -framerate 23 -s "$dimensions" \
            -i :0.0 -f pulse -i "$audio" -ac 1 \
            -c:v libx264 -pix_fmt yuv420p -preset veryfast -q:v 1 \
            -b:v 500k -b:a 128k \
            -vf scale=854x480 \
            -f flv "$output" &

        echo "$1" >"$recordid"
    fi
}

function getStreamToken() {
    $DMENU -p "推流" -mesg "插入 $1 令牌" -theme-str 'listview {lines: 0;}'
}

function startStreaming() {
    platform="$1"
    streamurl="$2"
    token=$(getStreamToken "$platform")

    if [ -z "$token" ]; then
        exit
    fi

    stream "$platform" "$streamurl/$token"
}

function streamOnBilibili() {
    startStreaming "Facebook" "rtmps://live-api-s.bilibili.com:443/rtmp"
}

function streamOnDouyin() {
    startStreaming "Twitch" "rtmp://sin.contribute.douyin.net/app"
}

function stoprecord() {
    if [ -f $recordid ]; then
        kill -15 $(cat $recordid)
        rm $recordid
    fi

    sleep 5
    if [ "$(pidof ffmpeg)" != "" ]; then
        pkill ffmpeg
    fi
}

function endrecord() {
    OPTIONS='["Yes", "No"]'
    select=$(echo $OPTIONS | jq -r ".[]" | $DMENU -p "录屏" -mesg "停止录屏" -theme-str 'window {width: 30%;} listview {lines: 2;}')
    [ "$select" == "Yes" ] && stoprecord
}

function startrecord() {
    OPTIONS='''
    [
        ["󰨜 Audio Video",         "audioVideo"],
        ["  Video Only",         "video"],
        ["  Audio Only",         "audio"],
        ["  Bilibili直播",       "streamOnBilibili"],
        ["既 抖音直播",           "streamOnDouyin"]
    ]
    '''

    select=$(echo $OPTIONS | jq -r ".[][0]" | $DMENU -p "录屏" -theme-str 'window {width: 30%;} listview {lines: 5;}')
    eval $(echo $OPTIONS | jq -r ".[] | select(.[0] == \"$select\") | .[1]")
}

function createSaveFolder() {
    if [ ! -d "$VIDEO" ]; then
        mkdir -p "$VIDEO"
    fi
    if [ ! -d "$AUDIO" ]; then
        mkdir -p "$AUDIO"
    fi
}

createSaveFolder

if [ -f $recordid ]; then
    endrecord
else
    startrecord
fi
