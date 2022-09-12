#!/bin/bash
sleep 1 
if [[ -d ~/Scripts/Lemonbar ]]; then
    exec --no-startup-id ~/Scripts/Lemonbar/lemonmenu.sh
fi
