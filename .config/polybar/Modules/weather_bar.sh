#wttr=$(curl -s 'wttr.in/Oslo?format=3')
wttr=$(curl -s 'wttr.in/Skien?format=3')
wttr=$(curl -s 'wttr.in/59.9691055,10.731255?format=3')
#wttr=$(curl -s 'wttr.in/Skien?format=v2')
#status=$(echo ${wttr} | cut -d ' ' -f 2-) #| tr -d '[:space:]')
#echo $status | grep -q "location" && exit 1
#echo $status
curl -s 'v2d.wttr.in/59.9691055,10.731255' | awk -F " |," ' /Weather:/ {print $2 "  " $(NF-6)}'
# curl -s v2d.wttr.in/Oslo | awk -F " |," ' /Weather:/ {print $2 "  " $(NF-6)}'


