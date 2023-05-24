#!/bin/sh
# Attach to tmux session 
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"

var1=$(tmux ls)
var2=$(tmuxifier list-sessions)
sessions="$var1\n$var2"
selected=$(echo -e "$sessions" | fzf)

if (( $? == 0 )); then

    if echo "$selected" | grep -q ":.*(created"; then
        tmux a -t $(echo "$selected" | cut --delimiter=":" --fields=1) 
    else
        tmuxifier load-session "$selected"
        # No server running
        (( $? == 127 )) && tmuxifier load-session "$selected"
    fi 

fi


