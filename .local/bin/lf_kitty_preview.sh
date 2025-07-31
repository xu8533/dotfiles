#!/usr/bin/env bash
CURRENT_TERM=$(ps -p $PPID -o comm=)

## save a cache file for faster preview
[ -d "$HOME/.cache/lf" ] || mkdir "$HOME/.cache/lf"

file=$1
w=$2
h=$3
x=$4
y=$5

preview() {
    if [[ "$CURRENT_TERM" == "alacritty" ]]; then
        # If in Alacritty, open a new kitty terminal to show the preview.
        kitty -e "kitty +kitten icat --silent --stdin no --transfer-mode file \"$1\""
    else
        # If in kitty or any other terminal, use the original method.
        kitty +kitten icat --silent --stdin no --transfer-mode file --place "${w}x${h}@${x}x${y}" "$1" </dev/null >/dev/tty
    fi
    exit 1
}

case "$(file -Lb --mime-type -- "$file")" in
image/*xcf | image/heic)
    CACHE="$HOME/.cache/lf/$(stat --printf '%s%n%Y' "$(readlink -f "$1")" | shasum | cut -d' ' -f1)"
    [ -f "${CACHE}.jpg" ] || convert "$1" -flatten -quality 50 "${CACHE}.jpg"
    preview "${CACHE}.jpg"
    ;;
image/*)
    preview "$1"
    ;;
video/*)
    CACHE="$HOME/.cache/lf/$(stat --printf '%s%n%Y' "$(readlink -f "$1")" | shasum | cut -d' ' -f1)"
    [ -f "${CACHE}.jpg" ] || /usr/bin/ffmpegthumbnailer -i "$1" -s 480 -q 5 -o "${CACHE}.jpg"
    preview "${CACHE}.jpg"
    ;;
audio/*)
    mid3v2 -l "$1"
    ;;
application/epub+zip)
    CACHE="$HOME/.cache/lf/$(stat --printf '%s%n%Y' "$(readlink -f "$1")" | shasum | cut -d' ' -f1)"
    [ -f "${CACHE}.png" ] || /usr/bin/gnome-epub-thumbnailer "$1" "$CACHE".png
    preview "$CACHE".png
    ;;
application/pdf)
    CACHE="$HOME/.cache/lf/$(stat --printf '%s%n%Y' "$(readlink -f "$1")" | shasum | cut -d' ' -f1)"
    # `pdftoppm` already adds `.jpg` extension, don't duplicate
    [ -f "${CACHE}.jpg" ] || /usr/bin/pdftoppm -f 1 -l 1 -singlefile -jpeg "$1" "$CACHE"
    preview "$CACHE".jpg
    ;;
application/zip)
    zipinfo "$1" | "$PAGER"
    ;;
application/gzip)
    zless "$1" | "$PAGER"
    ;;
application/*tar | application/*zip* | application/zstd | application/*xz)
    tar vvtf "$1" | "$PAGER"
    ;;
application/x-bittorrent)
    /usr/bin/transmission-show "$1" | "$PAGER"
    ;;
application/x-iso*)
    # `iso-info` command from `libcdio`
    iso-info "$1" | "$PAGER"
    ;;
application/*opendocument*)
    odt2txt "$1"
    ;;
text/html)
    lynx -width="$4" -display_charset=utf-8 -dump "$1"
    ;;
text/* | */xml | application/json | application/x-ndjson)
    bat --color always -p --theme Dracula "$1"
    ;;
application/octet-stream)
    file -b "$1"
    ;;
*)
    cat "$1"
    ;;
esac
