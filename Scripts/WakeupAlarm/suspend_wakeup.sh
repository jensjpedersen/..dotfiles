#!/bin/bash
diff=35 # Wake pc int minutes before alarm
delta_alarm=5 # Start alarm $delta_alarm after pc wakeup

export DISPLAY=:0
export XDG_RUNTIME_DIR=/run/user/1000

PROGNAME=$(basename $0)

function handle_interrupt {
    echo "Script interrupted."
    killall mpv
    exit 1
}

function error_exit {
    echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
    exit 1
}

trap handle_interrupt SIGINT

(( diff < 60 )) || error_exit "$LINENO: Not implemented" 

alarm=${1?"Error: requiers command line input - hh:mm"}

# Set crontab
IFS=':' read -r -a array <<< "$alarm"

# Fix array format
array[0]=${array[0]#0}
array[1]=${array[1]#0}

echo "Alarm set to ${array[0]}:${array[1]}"


today=$(date -d "today ${1}" '+%s')
now=$(date '+%s')


# Find pc wakeup time
if (( ${array[1]} >= $diff )); then
    min=$(( ${array[1]} - $diff ))
    wake="${array[0]}:$min"
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

# Find start time Light
if (( ${array[1]} >= $diff - $delta_alarm )); then
    min=$(( ${array[1]} - $diff + $delta_alarm ))
    hour=${array[0]}
else
    min=$(( 60 + ${array[1]} - $diff + $delta_alarm ))
    hour=$(( ${array[0]} - 1 ))
fi

# Enable wakeup scripts
echo "${array[1]} ${array[0]} * * * jensjp /bin/bash /home/jensjp/Scripts/WakeupAlarm/wakeup_music.sh" | sudo tee /etc/cron.d/wakeup_music
echo "${min} ${hour} * * * jensjp /bin/python3 /home/jensjp/Scripts/WakeupAlarm/wakeup_light.py" | sudo tee /etc/cron.d/wakeup_light

su jensjp -c /home/jensjp/Scripts/WakeupAlarm/prepare_suspend.sh

exit 0  



