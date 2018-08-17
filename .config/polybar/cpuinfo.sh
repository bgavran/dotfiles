#!/usr/bin/env bash

#SPEED=$(sensors | grep fan2 | grep -o "[0-9]\{2,4\}")
FREQ=$(cat /proc/cpuinfo | grep MHz | head -n1 | awk -F':' '{print $2}' | awk -F'.' '{print $1}')
TEMP=$(sensors | grep "Package id 0" | awk '{print $4}' | sed 's/+//g')
# echo ${FREQ}MHz ${SPEED}RPM ${TEMP}
echo ${FREQ}MHz ${TEMP}
