#!/usr/bin/env sh

# Check if wlogout is already running
if pgrep -x "wlogout" > /dev/null
then
    pkill -x "wlogout"
    exit 0
fi

# set file variables
# ScrDir=`dirname $(realpath $0)`
# source $ScrDir/globalcontrol.sh
wLayout="$HOME/.config/wlogout/layout_$1"
wlTmplt="$HOME/.config/wlogout/style_$1.css"
EnableWallDcol=0
# hypr var
hypr_border=`hyprctl -j getoption decoration:rounding | jq '.int'`
hypr_width=`hyprctl -j getoption general:border_size | jq '.int'`

# 可以使用下列命令获取gtkTheme和gtkMode变量，或直接指定
# gtkTheme=`gsettings get org.gnome.desktop.interface gtk-theme | sed "s/'//g"`
# gtkMode=`gsettings get org.gnome.desktop.interface color-scheme | sed "s/'//g" | awk -F '-' '{print $2}'`

# gtkTheme=Material-Sakura
# gtkTheme=Catppuccin-Mocha
# gtkTheme=Catppuccin-Latte
# gtkTheme=Cyberpunk-Edge
# gtkTheme=Decay-Green
gtkTheme=Frosted-Glass
# gtkTheme=Graphite-Mono
# gtkTheme=Gruvbox-Retro
# gtkTheme=Rose-Pine
# gtkTheme=Tokyo-Night
# gtkTheme=Wall-Dcol
# gtkMode=dark
gtkMode=light

if [ ! -f $wLayout ] || [ ! -f $wlTmplt ] ; then
    echo "错误: $1 配置未找到..."
    exit 1;
fi

# detect monitor res
x_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
y_mon=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
hypr_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')


# scale config layout and style
case $1 in
    1)  wlColms=6
        export mgn=$(( y_mon * 28 / hypr_scale ))
        export hvr=$(( y_mon * 23 / hypr_scale )) ;;
    2)  wlColms=2
        export x_mgn=$(( x_mon * 35 / hypr_scale ))
        export y_mgn=$(( y_mon * 25 / hypr_scale ))
        export x_hvr=$(( x_mon * 32 / hypr_scale ))
        export y_hvr=$(( y_mon * 20 / hypr_scale )) ;;
esac

# scale font size
export fntSize=$(( y_mon * 2 / 100 ))

# detect gtk system theme
export BtnCol=`[ "$gtkMode" == "dark" ] && ( echo "white" ) || ( echo "black" )`
export WindBg=`[ "$gtkMode" == "dark" ] && ( echo "rgba(0,0,0,0.5)" ) || ( echo "rgba(255,255,255,0.5)" )`

if [ "$EnableWallDcol" -eq 1 ] ; then
    export wbarTheme="Wall-Dcol"
else
    export wbarTheme="${gtkTheme}"
fi

# eval hypr border radius
export active_rad=$(( hypr_border * 5 ))
export button_rad=$(( hypr_border * 8 ))

# eval config files
wlStyle=`envsubst < $wlTmplt`

# launch wlogout
wlogout -b $wlColms -c 0 -r 0 -m 0 --layout $wLayout --css <(echo "$wlStyle") --protocol layer-shell
