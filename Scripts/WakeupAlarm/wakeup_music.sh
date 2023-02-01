#!/bin/bash
# Start playlist and increase volume every 2. second
export PULSE_RUNTIME_PATH="/run/user/$(id -u)/pulse/"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
min_vol=10
max_vol=100

dir_path=$(dirname $(realpath $0))
log_path="$dir_path/wakeup_music.log"

echo $(date) >> "$log_path"

for i in {1..5}; do
    # Try to adjust volume to min_vol
    echo "attempt ${i}" >> "$log_path"
    volume=$(pactl get-sink-volume @DEFAULT_SINK@  | grep -o "[0-9]\+%" | head -n 1)
    pactl set-sink-volume @DEFAULT_SINK@ $min_vol%
    [[ $volume == "${min_vol}%" ]] && break
    sleep 1
done

min_vol=${volume%\%}

echo $min_vol >> "$log_path"
echo $(pactl list sinks) >> "$log_path"

spt play --uri "spotify:playlist:37i9dQZF1DX2sUQwD7tbmL" || playerctl -p spotify,ncspot play

n=$(($max_vol-$min_vol))
for i in $(seq 1 1 $n); do
    sleep 2
    # pactl set-sink-volume @DEFAULT_SINK@ +1%
    pactl set-sink-volume @DEFAULT_SINK@ $(($min_vol+$i))%
    echo $i >> "$log_path"
done

