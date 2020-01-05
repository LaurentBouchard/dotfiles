#!/usr/bin/env bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITOR=DVI-D-0 polybar base &
MONITOR=DVI-D-1 polybar opt &
MONITOR=HDMI-0 polybar opt &
