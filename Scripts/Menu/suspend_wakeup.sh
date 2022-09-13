#!/bin/bash

alarm=${1?"Error: requiers command line input - hh:mm"}

# Set crontab
IFS=':' read -r -a array <<< "$alarm"

echo "${array[1]} ${array[0]} * * * jensjp /bin/bash ${HOME}/Scripts/Cronjobs/wakeup_music.sh" | sudo tee /etc/cron.d/alarm

today=$(date -d "today ${1}" '+%s')
now=$(date '+%s')

# Set machine wakeup

diff=5 # Wake pc int minutes before alarm
if (( ${array[1]} >= $diff )); then
    min=$(( ${array[1]} - $diff ))
    wake="${array[0]}:$min"
else
    min=$(( 60 + ${array[1]} - $diff ))
    wake="${array[0]}:$min"
fi
# Fails down to here

if (( $now > $today)); then
    sudo rtcwake -m no -l -t $(date -d "tomorrow ${wake}" '+%s')
elif (( $now < $today )); then
    sudo rtcwake -m no -l -t $(date -d "today ${wake}" '+%s')
fi

# Ready for next day  
xrandr --output LVDS-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-1 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off
sleep 2

# Bedtime rutine
sleep 2m 
xset dpms force off
sleep 8m
playerctl -p spotify pause
mpv "/mnt/ssd/Meditation/Relaxing Sleep Music • Deep Sleeping Music, Relaxing Music, Stress Relief, Meditation Music (Flying)-1ZYbU82GVz4.m4a"
sleep 1m 
python $HOME/Scripts/TapoScripts/tapo.py n &
xrandr --output LVDS-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-1 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off
redshift -P -O 3000 -b 1
sleep 5
systemctl suspend


