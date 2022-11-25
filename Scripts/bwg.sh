#!/bin/bash
items=$(bw list items)
names=$(printf "%s" $(bw list items) | jq '.[].name')
select=$(echo "$names" | fzf)
element=$(printf "%s" "$items" | jq ".[] | select(.name == ${select})")
username=$(echo "$element" | jq '.login.username')
password=$(echo "$element" | jq '.login.password')

clipctl disable
echo -n ${username:1:-1}| xclip -select clipboard
echo "Copied Username"
read

echo -n ${password:1:-1} | xclip -select clipboard
echo "Copied Password"
clipctl enable





