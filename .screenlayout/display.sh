#!/bin/sh
xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --primary --mode 2560x1440 --pos 1920x0 --rotate normal --output VIRTUAL1 --off
nitrogen --restore
