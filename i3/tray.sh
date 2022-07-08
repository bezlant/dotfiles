#!/bin/bash

pkill -f blueman-applet
pkill -f nm-applet
pkill -f brave

blueman-applet &
nm-applet --indicator &
brave &
