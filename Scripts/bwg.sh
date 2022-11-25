#!/bin/bash
#
if [[ -z $BW_SESSION ]]; then 
    echo "Session variable does not exist." 
    exit 1
fi

items=$(bw list items)
names=$(printf "%s" $(bw list items) | jq '.[].name')
select=$(echo "$names" | fzf)
element=$(printf "%s" "$items" | jq ".[] | select(.name == ${select})")
username=( $(echo "$element" | jq '.login.username') )
password=( $(echo "$element" | jq '.login.password') )

index=0
if (( ${#username[@]} > 1 )); then
    echo Found multiple usernames. Choose one: 

    for i in $(seq 0 $((${#username[@]}-1))); do #${username[@]}
        echo $i ${username[$i]}
    done

    read -N 1 index

fi

clipctl disable
echo -n ${username[$index]:1:-1}| xclip -select clipboard
echo -e "\nCopied Username."
read

echo -n ${password[$index]:1:-1} | xclip -select clipboard
echo "Copied Password."
clipctl enable

