#!/usr/bin/env bash

res=$(echo \
"lock
suspend
exit
poweroff
reboot" \
| rofi -dmenu -p "system")

which loginctl &>/dev/null
if [ "$?" -eq 0 ]; then
    login_manager="loginctl"
else
    login_manager="systemctl"
fi
login_manager="systemctl"
case $res in
"lock")
    sleep 0.5;
    hyprlock;;
"exit")
    hyprctl dispatch exit;;
"poweroff")
    $login_manager poweroff;;
"reboot")
    $login_manager reboot;;
"suspend")
    $login_manager suspend;;
esac 
