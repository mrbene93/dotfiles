#!/bin/bash

# Function to set or reset PipeWire settings
set_pipewire() {
  local samplerate="$1"
  local quantum="$2"

  systemctl --user stop pipewire.service
  pw-metadata -n settings 0 clock.force-rate "${samplerate:-0}"
  pw-metadata -n settings 0 clock.force-quantum "${quantum:-0}"
  systemctl --user start pipewire.service
}

# Parse parameters: $1 = samplerate, $2 = quantum, rest = program + arguments
samplerate="$1"
quantum="$2"
shift 2  # Remove samplerate/quantum, remaining args = program + arguments

# Apply new PipeWire settings
set_pipewire "$samplerate" "$quantum"

# Start program only if additional arguments are provided
if [ $# -gt 0 ]; then
  echo "Starting program: $@"
  "$@"
  # Reset PipeWire after program exits (no args = reset to defaults)
  set_pipewire
else
  echo "Only PipeWire settings changed (no program started)."
fi
