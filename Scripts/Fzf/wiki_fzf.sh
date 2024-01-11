#!/bin/sh
# wiki=$HO#!/bin/bash
path=~/vimwiki
absolute_path=$(realpath $path)
files=$(fd "index.md" $path)
choice=$(echo "$files" | sed "s|${absolute_path}/||g" | sed 's|/index.md||g' | fzf)
file_path="$absolute_path/$choice/index.md"
[ -e ${vimwiki_file} ] && nvim ${file_path} 
