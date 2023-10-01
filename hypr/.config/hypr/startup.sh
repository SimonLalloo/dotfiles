#!/usr/bin/env bash

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

sleep 1
killall -e xdg-desktop-portal-wlr
killall xdg-desktop-portal
/usr/lib/xdg-desktop-portal-wlr &
sleep 1
/usr/lib/xdg-desktop-portal &

# Wallpapers
swww init &
swww img ~/Pictures/Wallpapers/wallpaper_2.jpg &

# Networking
nm-applet --indicator &

# Bar
waybar &

# Notrifications
dunst &

# Timeout and locking
exec swayidle -w \
          timeout 180 'systemctl suspend' \
          # before-sleep '$HOME/.config/hypr/lock.sh'\
          after-resume '$HOME/.config/hypr/lock.sh'
