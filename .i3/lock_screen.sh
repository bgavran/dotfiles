#!/usr/bin/env bash

sleep 0.1

notify-send "Locking..." -t 1000 -i system-lock-screen

icon="$HOME/.i3/icons/lock_icon.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"

convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" -filter Gaussian -resize 50% -define filter:sigma=5 -resize 200% "$tmpbg"
# convert "$tmpbg" -blur 0x5 "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"


i3lock -e -f -i "$tmpbg"

sleep 1
