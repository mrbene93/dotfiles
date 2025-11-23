#!/bin/bash


samplerate=$1
quantum=$2

# Stop Pipewire service
systemctl --user stop pipewire.service

# Set Pipewire settings or reset when variables are empty
pw-metadata -n settings 0 clock.force-rate $samplerate
pw-metadata -n settings 0 clock.force-quantum $quantum

# Start Pipewire service
systemctl --user start pipewire.service
