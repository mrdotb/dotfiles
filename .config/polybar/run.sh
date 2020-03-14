#!/usr/bin/env bash

config="/home/mrdotb/.config/polybar/config"
monitor=$(polybar -m|tail -1|sed -e 's/:.*$//g')

# The CPU temperature zone change across reboot
## Get the zone
zone=$(for i in /sys/class/hwmon/hwmon*/temp*_input;do echo "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*})) $(readlink -f $i)";done|gawk '{ if ($2 =="CPU") { print $3 } }')
## Replace the zone in polybar config
sed -i -e "s@hwmon-path.*@hwmon-path = $zone@g" $config

MONITOR=eDP-1 polybar top >>/tmp/polybar1.log 2>&1 &
MONITOR=eDP-1 polybar bottom >>/tmp/polybar1.log 2>&1 &
killall -q 9 polybar
while pgrep -u $UID -x polybar > /dev/null
do
  killall -q 9 polybar
  sleep 0.1
done

MONITOR=eDP-1 polybar top >>/tmp/polybar1.log 2>&1 &
MONITOR=eDP-1 polybar bottom >>/tmp/polybar1.log 2>&1 &
