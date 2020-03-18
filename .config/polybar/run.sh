#!/usr/bin/env bash

config="/home/mrdotb/.config/polybar/config"
monitor="eDP-1"
logfile="/tmp/polybar1.log"

# if $logfile is not here then it's boot time
if [ ! -f $logfile ]; then
  # The CPU temperature zone change across reboot
  ## Get the zone
  zone=$(for i in /sys/class/hwmon/hwmon*/temp*_input;do echo "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*})) $(readlink -f $i)";done|gawk '{ if ($2 =="CPU") { print $3 } }')

  ## Replace the temperature zone in polybar config
  sed -i -e "s@hwmon-path.*@hwmon-path = $zone@g" $config

  ## Launch 1st time
  MONITOR=$monitor polybar top >> $logfile 2>&1 &
  MONITOR=$monitor polybar bottom >> $logfile 2>&1 &
  sleep 1
fi

# Terminate already running bar instances
pkill -9 polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

# launch again
MONITOR=$monitor polybar top >> $logfile 2>&1 &
MONITOR=$monitor polybar bottom >> $logfile 2>&1 &
