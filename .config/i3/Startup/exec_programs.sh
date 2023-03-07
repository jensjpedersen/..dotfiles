#!/bin/bash
pgrep "sxhkd" || sxhkd &

if ! pgrep "polybar"; then
    xrandr --output LVDS-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-1 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off
    ~/.config/polybar/launch.sh &
    imwheel &
    redshift -P -O 3000 &
    clipmenud &
    syncthing -no-browser &
fi



