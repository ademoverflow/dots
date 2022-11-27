#!/bin/bash

# Terminate already running bar instances
killall -q polybar

if type "xrandr"; then
  # Primary monitor first
  PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
  MONITOR=$PRIMARY polybar --reload top &

  # Others
  OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)
  for monitor in ${OTHERS}; do
    MONITOR=$monitor polybar --reload top &
  done
else
  polybar --reload top &
fi
