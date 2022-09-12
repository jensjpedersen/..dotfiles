#!/bin/bash
running=$(pactl list sinks | awk '/RUNNING/','/Base Volume/')
idle=$(pactl list sinks | awk '/IDLE/','/Base Volume/')
suspended=$(pactl list sinks | awk '/SUSPENDED/','/Base Volume/')

symbol=蓼 
if [[ -n ${running} ]]; then
    volume=$(echo "${running}" | awk '/Volume: front-left:/ {print $5}')
    description=$(echo "${running}" | awk '/Description/ {print $2,$3}')
    mute=$(echo "$running" | awk '/Mute:/ {print $2}')
    symbol=
    if [[ ${mute} = "yes" ]]; then
        symbol=婢
    fi

elif [[ -n ${idle} ]]; then
    volume=$(echo "${idle}" | awk '/Volume: front-left:/ {print $5}' | tail -1)
    description=$(echo "${idle}" | awk '/Description/ {print $2,$3}' | tail -1)
    mute=$(echo "$idle" | awk '/Mute:/ {print $2}')
    if [[ ${mute} = "yes" ]]; then
        symbol=婢
    fi

elif [[ -n ${suspended} ]]; then
    volume=$(echo "${suspended}" | awk '/Volume: front-left:/ {print $5}' | tail -1)
    description=$(echo "${suspended}" | awk '/Description/ {print $2,$3}' | tail -1)
    mute=$(echo "$suspended" | awk '/Mute:/ {print $2}')
    if [[ ${mute} = "yes" ]]; then
        symbol=婢
    fi
fi

echo "${symbol} ${volume} ${description}"


