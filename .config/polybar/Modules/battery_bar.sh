#!/bin/zsh
# bat0=$(acpi -b | awk -F ' |%' '/Battery 0/ {print $(NF-1)}')
# bat1=$(acpi -b | awk -F ' |%' '/Battery 1/ {print $(NF-1)}')
#acpi -b | grep -o "[0-9]\+%"
bat0=$(acpi -b | grep "Battery 0:" | grep -o "[0-9]\+%")
bat0=${bat0%\%}
bat1=$(acpi -b | grep "Battery 1:" | grep -o "[0-9]\+%")
bat1=${bat1%\%}

charge=$(acpi -a | awk '{print $3}')

if [[ -n ${bat1} ]]; then
    msg="${bat0}/${bat1}"
    bat=$(( ${bat0} + ${bat1} ))
else
    msg=${bat0}
    bat=${bat0}
fi

if [ ${charge} = "on-line" ]; then
    if [ ${bat} -lt 30 ]
    then
        echo  ${msg}%
    elif [ ${bat} -gt 30 ] && [ ${bat} -lt 90 ]
    then
        echo  ${msg}%
    else
        echo  ${msg}%
    fi
else 
    if [ ${bat} -lt 30 ]
    then
        echo  ${msg}%
    elif [ ${bat} -gt 30 ] && [ ${bat} -lt 90 ]
    then
        echo  ${msg}%
    else
        echo  ${msg}%
    fi
fi
