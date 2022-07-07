#!/bin/sh
# Launch picom
picom &
# Keyboard layouts
setxkbmap -layout us,ru -option grp:win_space_toggle
# Screen layout
xrandr --output DVI-D-0 --mode 1280x1024 --pos 0x56 --rotate normal --output HDMI-0 --primary --mode 1920x1080 --pos 1280x0 --rotate normal --output DP-0 --off --output DP-1 --off
# Nitrogen for wallpapers
nitrogen --restore &
# Hide cursor when it's not used
unclutter --jitter 10 --ignore-scrolling --start-hidden --fork
# Volume controller
volctl &
# Start up discord
discord --start-minimized &
# Tool for screenshots
flameshot &
