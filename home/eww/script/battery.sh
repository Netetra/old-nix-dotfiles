#!/bin/bash

BAT=`ls /sys/class/power_supply | grep BAT | head -n 1`

if [[ "$1" == "--bat-capacity" ]]; then
  cat /sys/class/power_supply/${BAT}/capacity
elif [[ "$1" == "--bat-status" ]]; then
  cat /sys/class/power_supply/${BAT}/status
fi
