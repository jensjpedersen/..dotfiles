#!/bin/bash
diff=35 # Wake pc int minutes before alarm
delta_alarm=5 # Start alarm $delta_alarm after pc wakeup

PROGNAME=$(basename $0)
function error_exit
{
    echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
    exit 1
}

(( diff < 60 )) || error_exit "$LINENO: Not implemented" 

alarm=${1?"Error: requiers command line input - hh:mm"}

# Set crontab
IFS=':' read -r -a array <<< "$alarm"

# Fix array format
array[0]=${array[0]#0}
array[1]=${array[1]#0}


today=$(date -d "today ${1}" '+%s')
now=$(date '+%s')


# Find pc wakeup time
if (( ${array[1]} >= $diff )); then
    min=$(( ${array[1]} - $diff ))
    wake="${array[0]}:$min"
    echo $wake
else
    min=$(( 60 + ${array[1]} - $diff ))
    hour=$(( ${array[0]} - 1 ))
    echo $hour
    echo $min
    wake="$hour:$min"
fi

# Set machine wakeup
if (( $now > $today)); then
    sudo rtcwake -m no -l -t $(date -d "tomorrow ${wake}" '+%s')
    echo "Computer wakeup: Tomorrow ${wake}"
elif (( $now < $today )); then
    sudo rtcwake -m no -l -t $(date -d "today ${wake}" '+%s')
    echo "Computer wakeup: Today ${wake}"
fi

# Find start time alarm
if (( ${array[1]} >= $diff - $delta_alarm )); then
    min=$(( ${array[1]} - $diff + $delta_alarm ))
    hour=${array[0]}
else
    min=$(( 60 + ${array[1]} - $diff + $delta_alarm ))
    hour=$(( ${array[0]} - 1 ))
    echo $hour $min 
fi

# Enable wakeup scripts
echo "${array[1]} ${array[0]} * * * jensjp /bin/bash ${HOME}/Scripts/WakeupAlarm/wakeup_music.sh" | sudo tee /etc/cron.d/wakeup_music
echo "${min} ${hour} * * * jensjp /bin/python3 ${HOME}/Scripts/WakeupAlarm/wakeup_light.py" | sudo tee /etc/cron.d/wakeup_light

# Ready for next day  
xrandr --output LVDS-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-1 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off
sleep 2
# Bedtime rutine
sleep 2m 
xset dpms force off
playerctl -p spotify,ncspot pause
python $HOME/Scripts/TapoScripts/tapo.py n & # Turn off light
# mpv "/mnt/ssd/Meditation/Relaxing Sleep Music • Deep Sleeping Music, Relaxing Music, Stress Relief, Meditation Music (Flying)-1ZYbU82GVz4.m4a"
mpv --no-video "https://www.youtube.com/watch?v=xke2SoJVrbc"
xrandr --output LVDS-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA-1 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off
redshift -P -O 3000 -b 1
sleep 5
systemctl suspend


