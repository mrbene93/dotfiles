#!/bin/bash


# Menuentries
menu_entries=(
    " Sperren"
    "󰍃 Ausloggen"
    " Bereitschaft"
    "󰤄 Ruhezustand"
    "󰜉 Neu starten"
    " Herunterfahren" 
)

# Calculate width
max_length=$(printf "%s\n" "${menu_entries[@]}" | awk '{print length}' | sort -nr | head -1)
width=$((max_length + 1))

# Run fuzzel
selected_entry=$(printf "%s\n" "${menu_entries[@]}" | fuzzel --dmenu --minimal-lines --width ${width} --prompt "Sitzungsaktion  ")

# Actions
case "$selected_entry" in
    " Sperren") hyprlock --grace 2 ;;
    "󰍃 Ausloggen") hyprctl dispatch exit ;;
    " Bereitschaft") systemctl suspend ;;
    "󰤄 Ruhezustand") systemctl hibernate ;;
    "󰜉 Neu starten") systemctl reboot ;;
    " Herunterfahren") systemctl poweroff ;;
    *) exit 0 ;;
esac
