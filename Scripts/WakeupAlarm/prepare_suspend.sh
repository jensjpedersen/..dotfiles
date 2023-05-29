#!/bin/bash 
# Run as user 'jensjp'
#
# Ready for next day  
xset dpms force on
xrandr --output LVDS-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-1 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off
mpv --no-audio --fullscreen --loop-file='inf' /home/jensjp/fireplace.mp4 >/dev/null &
pid=$!
sleep 15m 
kill $pid
sleep 1 
xset dpms force off
playerctl -p spotify,ncspot pause
python /home/jensjp/Scripts/TapoScripts/tapo.py n & # Turn off light
# mpv "/mnt/ssd/Meditation/Relaxing Sleep Music • Deep Sleeping Music, Relaxing Music, Stress Relief, Meditation Music (Flying)-1ZYbU82GVz4.m4a"
mpv --no-video "/mnt/ssd/Media/Yoga/Yoga Nidra Sleep Meditation Guided with Female Voice-xke2SoJVrbc.webm" >/dev/null
xrandr --output LVDS-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-1 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off
redshift -P -O 3000 -b 1
sleep 5
systemctl suspend



