#!/usr/bin/env bash
## Available Styles
## style-1   style-2   style-3   style-4   style-5

# Current Theme
dir="${HOME}/.config/rofi/scripts/powermenu"
theme='style-2'
# theme='style-5'

# CMDs
lastlogin="$(last $USER | head -n1 | awk '{print $5 "号 "$6" "$7" "$8}')"
uptime="$(uptime -p | sed -e 's/up //g' | sed -e 's/ hours/小时/' | sed -e 's/ minutes/分钟/')"
host=$(hostname)

# Options
hibernate='󰏦'
shutdown=''
reboot=''
lock=''
suspend=''
logout=''
yes='󰩐'
no='󰜺'

# Rofi CMD
rofi_cmd() {
    rofi -dmenu \
        -p " $USER@$host" \
        -mesg "󰪫 最近登录: ${lastlogin} |  开机时长: ${uptime}" \
        -theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
    rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
        -theme-str 'mainbox {children: [ "message", "listview" ];}' \
        -theme-str 'listview {columns: 2; lines: 1;}' \
        -theme-str 'element-text {horizontal-align: 0.5;}' \
        -theme-str 'textbox {horizontal-align: 0.5;}' \
        -dmenu \
        -p '确认' \
        -mesg '请确认?' \
        -theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
    echo -e "${yes}\n${no}" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "${lock}\n${suspend}\n${logout}\n${hibernate}\n${reboot}\n${shutdown}" | rofi_cmd
}

# Execute Command
run_cmd() {
    selected="$(confirm_exit)"
    if [[ "$selected" == "$yes" ]]; then
        if [[ $1 == '--shutdown' ]]; then
            systemctl poweroff
        elif [[ $1 == '--reboot' ]]; then
            systemctl reboot
        elif [[ $1 == '--hibernate' ]]; then
            systemctl hibernate
        elif [[ $1 == '--suspend' ]]; then
            systemctl suspend
        elif [[ $1 == '--logout' ]]; then
            if [[ "$XDG_CURRENT_DESKTOP" == 'Hyprland' ]]; then
                hyprctl clients -j | jq -r '.[].pid' | xargs kill
                hyprctl dispatch 'hl.dsp.exit()'
            elif [[ "$XDG_CURRENT_DESKTOP" == 'niri' ]]; then
                niri msg --json windows | jq -r '.[].pid' | xargs kill
                niri msg action quit --skip-confirmation
            fi
        fi
    else
        exit 0
    fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
"$shutdown")
    run_cmd --shutdown
    ;;
"$reboot")
    run_cmd --reboot
    ;;
"$hibernate")
    run_cmd --hibernate
    ;;
"$lock")
    if [[ -x '/usr/bin/hyprlock' ]]; then
        hyprlock
    elif [[ -x '/usr/bin/loginctl' ]]; then
        loginctl lock-session
    fi
    ;;
"$suspend")
    run_cmd --suspend
    ;;
"$logout")
    run_cmd --logout
    ;;
esac
