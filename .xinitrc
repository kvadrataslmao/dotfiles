#!/bin/sh
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --dpi 96
xrandr --auto
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets 2>/dev/null)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK
[ -f "$HOME/.xprofile" ] && . ~/.xprofile

while :; do
	ssh-agent dwm || break
done
