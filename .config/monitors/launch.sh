#!/bin/bash

device=$(find /sys/devices -name "edid" | cut -d/ -f 8)
device=$(echo "${device#*-}")-1

xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode ${device} 1920x1080_60.00

xrandr \
    --output DP-2 --mode 5120x1440 --pos 0x0 --rotate normal \
    --output ${device} --mode 1920x1080_60.00 --pos 1600x1440 --rotate normal
