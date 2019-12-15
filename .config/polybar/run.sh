#!/bin/bash
while ! `pgrep -x Xorg > /dev/null`
do
  sleep 1
done

while pgrep -u $UID -x polybar > /dev/null
do
  kill -9 `pgrep -u $UID -x polybar`
  sleep 1;
done

MONITOR=eDP-1-1 polybar top
