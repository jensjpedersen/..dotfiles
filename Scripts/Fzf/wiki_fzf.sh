#!/bin/sh
wiki=$HOME/vimwiki
files=$(fd "index.md" ~/vimwiki)
dir=$(echo "$files" | awk -F "/" '{print $(NF-1)}')
vimwiki_choice=$(echo "${dir}" | fzf)
vimwiki_file=$(echo "${files}" | grep "${vimwiki_choice}/index.md")
[ -e ${vimwiki_file} ] && nvim ${vimwiki_file} 
