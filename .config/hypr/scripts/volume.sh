#!/usr/bin/env bash

iDIR="$HOME/.config/dunst/icons/vol"

# Get Volume
get_volume() {
	volume=$(pamixer --get-volume)
	echo "$volume"
}

# Get icons
# get_icon() {
# 	current=$(get_volume)
# 	if [[ "$current" -eq "0" ]]; then
# 		echo "$iDIR/volume-mute.png"
# 	elif [[ ("$current" -ge "0") && ("$current" -le "30") ]]; then
# 		echo "$iDIR/volume-low.png"
# 	elif [[ ("$current" -ge "30") && ("$current" -le "60") ]]; then
# 		echo "$iDIR/volume-mid.png"
# 	elif [[ ("$current" -ge "60") && ("$current" -le "100") ]]; then
# 		echo "$iDIR/volume-high.png"
# 	fi
# }

get_icon() {
	current=$(get_volume)
	if [[ "$current" -eq "0" ]]; then
		echo "$iDIR/volume-mute.png"
	elif [[ ("$current" -gt "0") && ("$current" -le "10") ]]; then
		echo "$iDIR/vol-0.svg"
	elif [[ ("$current" -gt "10") && ("$current" -le "15") ]]; then
		echo "$iDIR/vol-10.svg"
	elif [[ ("$current" -gt "15") && ("$current" -le "20") ]]; then
		echo "$iDIR/vol-15.svg"
	elif [[ ("$current" -gt "20") && ("$current" -le "25") ]]; then
		echo "$iDIR/vol-20.svg"
	elif [[ ("$current" -gt "25") && ("$current" -le "30") ]]; then
		echo "$iDIR/vol-25.svg"
	elif [[ ("$current" -gt "30") && ("$current" -le "35") ]]; then
		echo "$iDIR/vol-30.svg"
	elif [[ ("$current" -gt "35") && ("$current" -le "40") ]]; then
		echo "$iDIR/vol-35.svg"
	elif [[ ("$current" -gt "40") && ("$current" -le "45") ]]; then
		echo "$iDIR/vol-40.svg"
	elif [[ ("$current" -gt "45") && ("$current" -le "50") ]]; then
		echo "$iDIR/vol-45.svg"
	elif [[ ("$current" -gt "50") && ("$current" -le "55") ]]; then
		echo "$iDIR/vol-50.svg"
	elif [[ ("$current" -gt "55") && ("$current" -le "60") ]]; then
		echo "$iDIR/vol-55.svg"
	elif [[ ("$current" -gt "60") && ("$current" -le "65") ]]; then
		echo "$iDIR/vol-60.svg"
	elif [[ ("$current" -gt "65") && ("$current" -le "70") ]]; then
		echo "$iDIR/vol-65.svg"
	elif [[ ("$current" -gt "70") && ("$current" -le "75") ]]; then
		echo "$iDIR/vol-70.svg"
	elif [[ ("$current" -gt "75") && ("$current" -le "80") ]]; then
		echo "$iDIR/vol-75.svg"
	elif [[ ("$current" -gt "80") && ("$current" -le "85") ]]; then
		echo "$iDIR/vol-80.svg"
	elif [[ ("$current" -gt "85") && ("$current" -le "90") ]]; then
		echo "$iDIR/vol-85.svg"
	elif [[ ("$current" -gt "90") && ("$current" -le "95") ]]; then
		echo "$iDIR/vol-90.svg"
	elif [[ ("$current" -gt "95") && ("$current" -le "99") ]]; then
		echo "$iDIR/vol-95.svg"
	elif [[ "$current" -eq "100" ]]; then
		# echo "$iDIR/vol-100.svg"
		echo "$iDIR/volume-high.png"
	fi
}

# Notify
notify_user() {
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "音量: $(get_volume) %"
}

# Increase Volume
inc_volume() {
	pamixer -i 5 && notify_user
}

# Decrease Volume
dec_volume() {
	pamixer -d 5 && notify_user
}

# Toggle Mute
toggle_mute() {
	if [ "$(pamixer --get-mute)" == "false" ]; then
		pamixer -m && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/volume-mute.png" "已静音"
	elif [ "$(pamixer --get-mute)" == "true" ]; then
		pamixer -u && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "解除静音"
	fi
}

# Toggle Mic
toggle_mic() {
	if [ "$(pamixer --default-source --get-mute)" == "false" ]; then
		pamixer --default-source -m && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/microphone-mute.png" "麦克风已静音"
	elif [ "$(pamixer --default-source --get-mute)" == "true" ]; then
		pamixer -u --default-source u && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/microphone.png" "麦克风静音解除"
	fi
}
# Get icons
get_mic_icon() {
	current=$(pamixer --default-source --get-volume)
	if [[ "$current" -eq "0" ]]; then
		echo "$iDIR/microphone.png"
	elif [[ ("$current" -ge "0") && ("$current" -le "30") ]]; then
		echo "$iDIR/microphone.png"
	elif [[ ("$current" -ge "30") && ("$current" -le "60") ]]; then
		echo "$iDIR/microphone.png"
	elif [[ ("$current" -ge "60") && ("$current" -le "100") ]]; then
		echo "$iDIR/microphone.png"
	fi
}
# Notify
notify_mic_user() {
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_mic_icon)" "Mic-Level : $(pamixer --default-source --get-volume) %"
}

# Increase MIC Volume
inc_mic_volume() {
	pamixer --default-source -i 5 && notify_mic_user
}

# Decrease MIC Volume
dec_mic_volume() {
	pamixer --default-source -d 5 && notify_mic_user
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
	get_volume
elif [[ "$1" == "--inc" ]]; then
	inc_volume
elif [[ "$1" == "--dec" ]]; then
	dec_volume
elif [[ "$1" == "--toggle" ]]; then
	toggle_mute
elif [[ "$1" == "--toggle-mic" ]]; then
	toggle_mic
elif [[ "$1" == "--get-icon" ]]; then
	get_icon
elif [[ "$1" == "--get-mic-icon" ]]; then
	get_mic_icon
elif [[ "$1" == "--mic-inc" ]]; then
	inc_mic_volume
elif [[ "$1" == "--mic-dec" ]]; then
	dec_mic_volume
else
	get_volume
fi
