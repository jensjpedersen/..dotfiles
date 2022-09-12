wttr=$(curl -s 'wttr.in/Oslo?format=3')
#wttr=$(curl -s 'wttr.in/Skien?format=v2')
status=$(echo ${wttr} | cut -d ' ' -f 2-) #| tr -d '[:space:]')
echo $status | grep -q "location" && exit 1
echo $status


