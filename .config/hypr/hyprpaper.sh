#!/bin/bash
######################
## HYPRPAPER SCRIPT ##
######################
# https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/


# Variables
wallpaper_dir="$HOME/Hintergrundbilder"

# Get random Wallpaper
wallpaper=$(find "$wallpaper_dir" -type f | shut -n 1)

# Set Wallpaper
hyprctl hyprpaper reload ,"$wallpaper"
