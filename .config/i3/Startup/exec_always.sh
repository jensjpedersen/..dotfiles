#!/bin/bash
sleep 1 
if [[ -d ${HOME}/Projects/Lemonmenu ]]; then
    setsid bash /home/jensjp/Projects/Lemonmenu/lemonmenu.sh
fi
