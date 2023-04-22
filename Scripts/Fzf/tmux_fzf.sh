#!/bin/sh
# Attach to tmux session 
selected=$(tmux ls | fzf)
(( $? == 0 )) && tmux a -t $(echo $selected | cut --delimiter=":" --fields=1) 

