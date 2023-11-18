#!/bin/bash
a=$(df -h /dev/sda1 | awk '/dev/ {print $(NF-2)}')
b=$(df -h /dev/sdb1 | awk '/dev/ {print $(NF-2)}')
echo " ${a}|${b}"

