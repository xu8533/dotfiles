#!/usr/bin/env bash

iDIR="$HOME/.config/dunst/icons/brightness"

# Get brightness
get_backlight() {
	LIGHT=$(brightnessctl | grep "Current brightness" | awk -F":" '{print $2}' | awk '{print $2}' | awk -F"%" '{print $1}' | tr -d \()
	echo "${LIGHT}"
}

# Get icons
get_icon() {
	current="$(get_backlight)"
	if [[ ("$current" -eq "0") ]]; then
		icon="$iDIR/brightness-20.png"
	elif [[ ("$current" -gt "0") && ("$current" -le "20") ]]; then
		icon="$iDIR/brightness-20.png"
	elif [[ ("$current" -gt "20") && ("$current" -le "40") ]]; then
		icon="$iDIR/brightness-40.png"
	elif [[ ("$current" -gt "40") && ("$current" -le "60") ]]; then
		icon="$iDIR/brightness-60.png"
	elif [[ ("$current" -gt "60") && ("$current" -le "80") ]]; then
		icon="$iDIR/brightness-80.png"
	elif [[ ("$current" -gt "80") && ("$current" -le "100") ]]; then
		icon="$iDIR/brightness-100.png"
	fi
}

# Notify
notify_user() {
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$icon" "亮度: $(get_backlight)%"
}

# Increase brightness
inc_backlight() {
	brightnessctl s +2% && get_icon && notify_user
}

# Decrease brightness
dec_backlight() {
	brightnessctl s 2%- && get_icon && notify_user
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
	get_backlight
elif [[ "$1" == "--inc" ]]; then
	inc_backlight
elif [[ "$1" == "--dec" ]]; then
	dec_backlight
else
	get_backlight
fi
