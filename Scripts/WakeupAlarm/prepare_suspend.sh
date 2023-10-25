#!/bin/bash 
# Run as user 'jensjp'
#
# Ready for next day  
# Get current dir
xset dpms force on
# xrandr --output LVDS-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-1 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off
mpv --no-audio --fullscreen --loop-file='inf' "$HOME/Scripts/WakeupAlarm/fireplace.mp4" &>/dev/null &
pid=$!
sleep 10m 
kill $pid
sleep 1 
xset dpms force off
playerctl -p spotify,ncspot pause
echo 'standby 0.0.0.0' | sudo cec-client -s -d 1
/home/jensjp/Scripts/TapoScripts/venv/bin/python3 /home/jensjp/Scripts/TapoScripts/tapo.py n & # Turn off light
# mpv "/mnt/ssd/Meditation/Relaxing Sleep Music • Deep Sleeping Music, Relaxing Music, Stress Relief, Meditation Music (Flying)-1ZYbU82GVz4.m4a"
# mpv --no-video "$HOME/Scripts/WakeupAlarm/yoga_nidra.mp3" &>/dev/null
# xrandr --output LVDS-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-1 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off
redshift -P -O 3000 -b 1
sleep 5h
systemctl suspend



