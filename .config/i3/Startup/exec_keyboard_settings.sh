#!/bin/bash
# Set keyboard layout
setxkbmap -layout no
sleep 1
# setxkbmap -option caps:escape
sleep 1
setxkbmap -option lv3:lalt_switch
#sleep 1
#setxkbmap -option ctrl:rctrl_ralt
sleep 1
setxkbmap -model pc105
sleep 1
setxkbmap -option caps:escape
sleep 1
xset r rate 500 50
sleep 1 
# xkbcomp $HOME/.config/i3/Startup/.Xkeymap $DISPLAY
xmodmap "$HOME/.config/i3/Startup/.Xmodmap"
