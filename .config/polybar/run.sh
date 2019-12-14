#!/bin/bash
while pgrep -u $UID -x polybar > /dev/null
do
  kill -9 `pgrep -u $UID -x polybar`
  sleep 1;
done

MONITOR=eDP-1-1 polybar top
