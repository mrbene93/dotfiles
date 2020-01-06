#!/bin/bash


# remove all existing keybindings
hc keyunbind --all

# tags
hc rename default "${tag_names[0]}" || true
for i in ${!tag_names[@]} ; do
    hc add "${tag_names[$i]}"
    key="${tag_keys[$i]}"
    if ! [ -z "$key" ] ; then
        hc keybind "$Mod-$key" use_index "$i"
        hc keybind "$Mod-Shift-$key" move_index "$i"
    fi
done

# basic
hc keybind $Mod-Shift-r		reload
hc keybind $Mod-Shift-q		close
hc keybind $Mod-Return		spawn	urxvtc
hc keybind $Mod-d		spawn	rofi -show run -case-sensitive -width 25 -lines 15 -columns 3 -font "Terminus 10" -fg "#616161" -bg "#212121" -hlbg "#212121" -hlfg "#ffffff" -bc "#212121"
hc keybind $Mod-l		spawn	$HOME/.config/herbstluftwm/prompt.sh

# focusing clients
hc keybind $Mod-Left		focus	left
hc keybind $Mod-Down		focus	down
hc keybind $Mod-Up		focus	up
hc keybind $Mod-Right		focus	right

# moving clients
hc keybind $Mod-Shift-Left	shift	left
hc keybind $Mod-Shift-Down	shift	down
hc keybind $Mod-Shift-Up	shift	up
hc keybind $Mod-Shift-Right	shift	right

# splitting frames
# create an empty frame at the specified direction
hc keybind $Mod-h		split   bottom  0.5
hc keybind $Mod-v		split   right   0.5
# let the current frame explode into subframes
hc keybind $Mod-e		split	explode

# resizing frames
resizestep=0.025
hc keybind $Mod-Control-Left	resize	left	+$resizestep
hc keybind $Mod-Control-Down	resize	down	+$resizestep
hc keybind $Mod-Control-Up	resize	up	+$resizestep
hc keybind $Mod-Control-Right	resize	right	+$resizestep

# cycle through tags
hc keybind $Mod-period	use_index	+1 --skip-visible
hc keybind $Mod-comma	use_index	-1 --skip-visible

# layouting
hc keybind $Mod-r		remove
hc keybind $Mod-space		cycle_layout 1
hc keybind $Mod-s		floating toggle
hc keybind $Mod-f		fullscreen toggle
hc keybind $Mod-p		pseudotile toggle
hc keybind $Mod-g		toggle window_gap

# focus
hc keybind $Mod-m		cycle_monitor
hc keybind $Mod-Tab		cycle_all +1
hc keybind $Mod-Shift-Tab	cycle_all -1
hc keybind $Mod-c		cycle
hc keybind $Mod-i		jumpto urgent

# f-keys
hc keybind $Mod-F5		spawn	mpc prev
hc keybind $Mod-F6		spawn	mpc next
hc keybind $Mod-F7		spawn	mpc toggle
hc keybind $Mod-F8		spawn	mpc stop
hc keybind $Mod-F9		spawn	amixer -q sset Master toggle
hc keybind $Mod-F10		spawn	amixer -q sset Master 5%-
hc keybind $Mod-F11		spawn	amixer -q sset Master 5%+
