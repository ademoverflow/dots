#!/bin/bash

# Terminate already running bar instances
killall -q polybar

if type "xrandr"; then
  for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$monitor polybar --reload top &
  done
else
  polybar --reload top &
fi
