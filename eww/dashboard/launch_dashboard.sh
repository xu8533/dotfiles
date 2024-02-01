#!/usr/bin/env bash

## Files and cmd
FILE="$HOME/.cache/eww_launch.dashboard"
CFG="$HOME/.config/eww/dashboard"
EWW=$(which eww)

## Run eww daemon if not running already
if [[ ! $(pidof eww) ]]; then
	${EWW} daemon
	sleep 1
fi

# twitter
## Open widgets
run_eww() {
	${EWW} --config "$CFG" open-many \
		background \
		profile \
		system \
		clock \
		uptime \
		music \
		github \
		apps \
		logout \
		sleep \
		reboot \
		poweroff \
		folders \
		reddit \
		youtube \
		weather \
		bilibili \
		mail
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	run_eww
else
	${EWW} --config "$CFG" close \
		background \
		profile \
		system \
		clock \
		uptime \
		music \
		github \
		reddit \
		youtube \
		weather \
		apps \
		mail \
		logout \
		sleep \
		reboot \
		poweroff \
		folders \
		bilibili
	rm "$FILE"
fi
