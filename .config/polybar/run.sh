#!/usr/bin/env bash

config="/home/mrdotb/.config/polybar/config"
monitor=$(ppolybar -m|tail -1|sed -e 's/:.*$//g'olybar -m|tail -1|sed -e 's/:.*$//g')

# The CPU temperature zone change across reboot
## Get the zone
zone=$(for i in /sys/class/hwmon/hwmon*/temp*_input;do echo "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*})) $(readlink -f $i)";done|gawk '{ if ($2 =="CPU") { print $3 } }')
## Replace the temperature zone in polybar config
sed -i -e "s@hwmon-path.*@hwmon-path = $zone@g" $config

# launch and kill to prevent a bug at computer boot
MONITOR=$monitor polybar top >>/tmp/polybar1.log 2>&1 &
MONITOR=$monitor polybar bottom >>/tmp/polybar1.log 2>&1 &

# sleep before kill
sleep 0.1

# Terminate already running bar instances
killall -q 9 polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch again
MONITOR=$monitor polybar top >>/tmp/polybar1.log 2>&1 &
MONITOR=$monitor polybar bottom >>/tmp/polybar1.log 2>&1 &
