#!/bin/bash

pkill -f blueman-applet
pkill -f nm-applet

blueman-applet &
nm-applet --indicator &
