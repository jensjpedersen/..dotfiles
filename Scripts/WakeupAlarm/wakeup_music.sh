#!/bin/bash
# Start playlist and increase volume every 2. second
export PULSE_RUNTIME_PATH="/run/user/$(id -u)/pulse/"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
min_vol=10
max_vol=100
pactl set-sink-volume @DEFAULT_SINK@ $min_vol%
spt play --uri "spotify:playlist:3jCrURN2fLkFnxfNkwCoXH" || playerctl -p spotify play
n=$(($max_vol-$min_vol))
for i in $(seq 1 1 $n); do
    sleep 2
    pactl set-sink-volume @DEFAULT_SINK@ +1%
done

