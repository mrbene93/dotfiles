#!/bin/bash


value="$(echo -e "Lock\nLogoff (quit X)\nShutdown\nReboot" | \
	rofi -dmenu -width 20 -lines 6 -columns 1 -font "Terminus 14" -fg "#616161" -bg "#212121" -hlbg "#212121" -hlfg "#ffffff" -bc "#212121")"
case $value in
	Lock)
		i3lock -f -i $HOME/.wallpaper.png
		;;
	Logoff*)
		yesno="$(echo -e "Yes\nNo" | \
			rofi -dmenu -width 10 -lines 2 -columns 1 -font "Terminus 14" -fg "#616161" -bg "#212121" -hlbg "#212121" -hlfg "#ffffff" -bc "#212121")"
		if [ $yesno == "Yes" ]; then
			herbstclient quit
		fi
		;;
	Shutdown)
		yesno="$(echo -e "Yes\nNo" | \
			rofi -dmenu -width 10 -lines 2 -columns 1 -font "Terminus 14" -fg "#616161" -bg "#212121" -hlbg "#212121" -hlfg "#ffffff" -bc "#212121")"
		if [ $yesno == "Yes" ]; then
			shutdown -h now
		fi
		;;
	Reboot)
		yesno="$(echo -e "Yes\nNo" | \
			rofi -dmenu -width 10 -lines 2 -columns 1 -font "Terminus 14" -fg "#616161" -bg "#212121" -hlbg "#212121" -hlfg "#ffffff" -bc "#212121")"
		if [ $yesno == "Yes" ]; then
			shutdown -r now
		fi
		;;
esac
