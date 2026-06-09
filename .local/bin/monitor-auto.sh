#!/usr/bin/env bash

wm=$(echo $XDG_CURRENT_DESKTOP 2>/dev/null)

# Function to apply monitor configuration
apply_monitor_config() {
    if is_dp1_connected; then
        # External monitor connected - disable laptop screen
        case "$wm" in
        Hyprland)
            hyprctl keyword monitor "eDP-1, disable"
            hyprctl keyword monitor ", preferred, auto-up, 1, "
            ;;
        niri)
            niri msg output eDP-1 off
            niri msg output HDMI-A-1 on
            ;;
        esac
    else
        # No external monitor - enable laptop screen with specified resolution
        case "$wm" in
        Hyprland)
            hyprctl keyword monitor "eDP-1, enable"
            ;;
        niri)
            niri msg output eDP-1 on
            ;;
        esac
    fi
}

# Function to check if DP-1 is physically connected
is_dp1_connected() {
    for status_file in /sys/class/drm/card*/card*-HDMI-A-1/status; do
        if [ -f "$status_file" ]; then
            if grep -q "^connected" "$status_file" 2>/dev/null; then
                return 0 # found connected DP-1
            fi
        fi
    done

    return 1 # not found or not connected
}

# Monitor loop - check every 30 seconds
while true; do
    if is_dp1_connected; then
        current_state=0
    else
        current_state=1
    fi

    if [ "$current_state" != "$previous_state" ]; then
        apply_monitor_config

        previous_state=$current_state
    fi

    sleep 30
done
