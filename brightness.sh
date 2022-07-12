#!/usr/bin/env bash

usage_msg="usage: $0 (dec|inc)"

if [ $# -ne 1 ]; then
  echo "$usage_msg"
  exit 1;
fi

display="intel_backlight"

current_brightness=$(brightnessctl -l | grep -A 1 $display | tail -n 1 | sed 's/.*(\([^)]*\)%).*/\1/')

if [ $1 = "dec" ] && [ $current_brightness -ge 10 ]; then
  new_brightness=$((current_brightness - 10))
elif [ $1 = "inc" ] && [ $current_brightness -le 90 ]; then
  new_brightness=$((current_brightness + 10))
else
  echo "$usage_msg"
  exit 1
fi

brightnessctl -d $display set "$new_brightness%"
