#! /bin/zsh
#signal=$(nmcli device wifi list | grep "*" | awk '{print $8}')%
signal=$(nmcli device wifi list | awk '/*/ {print $(NF-2)}')%
echo $signal

