#!/bin/bash
tmpbg='/tmp/screen.png'
scrot -o ${tmpbg}
#convert ${tmpbg} -blur 0x2 ${tmpbg}
i3lock -i ${tmpbg}
