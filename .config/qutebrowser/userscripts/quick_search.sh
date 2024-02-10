#!/bin/bash
# TODO: use prompt mode
#
# window="$(xdotool search --sync --all --onlyvisible --name qutebrowser)"
# xdotool mousemove --window $window 10 500 click --window $window 1
xdotool click 1

# Send keystroke
alacritty --class="quick_search" --config-file="${HOME}/.config/qutebrowser/userscripts/quick_search.yaml"
