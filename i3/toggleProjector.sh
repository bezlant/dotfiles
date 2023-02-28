#!/bin/bash
intern=eDP
extern=HDMI-A-0

if xrandr | grep "$extern disconnected"; then
	xrandr --output "$extern" --off --output "$intern" --auto
else
	xrandr --output "$intern" --off --output "$extern" --auto
fi
# Turn this into an i3 config script
# xrandr --output eDP --mode 2560x1600
# xrandr --output HDMI-A-0 --off
