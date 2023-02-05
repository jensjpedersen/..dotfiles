#!/bin/bash
# config ls-files
config_files=$(/usr/bin/git --git-dir=$HOME/..dotfiles/ --work-tree=$HOME ls-files)
config_file=$(echo "${config_files}" | fzf) 
echo $config_file
[[ -e ${config_file} ]] && nvim ${config_file} # Check if index.md file exist and open in vim

