#!/bin/bash

sleep 1
MONITOR=eDP-1-1 polybar top &>> /home/mrdotb/.config/polybar/polylog &
MONITOR=eDP-1-1 polybar bottom &>> /home/mrdotb/.config/polybar/polylog &
killall -q 9 polybar
while pgrep -u $UID -x polybar > /dev/null
do
  killall -q 9 polybar
  sleep 0.1
done

MONITOR=eDP-1-1 polybar top &>> /home/mrdotb/.config/polybar/polylog &
MONITOR=eDP-1-1 polybar bottom &>> /home/mrdotb/.config/polybar/polylog &
