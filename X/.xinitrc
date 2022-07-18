#!/bin/sh

userresources=$HOME/.config/X/.Xresources
usermodmap=$HOME/.config/X/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
feh --bg-fill --randomize ~/.wallpapers &
clight &
xautolock -time 15 -locker my3lock &
picom --experimental-backends &
exec i3
