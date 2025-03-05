#!/bin/bash

mkdir -p /run/dbus
dbus-daemon --system --fork

export XDG_RUNTIME_DIR=/tmp 

# Start Xvfb in the background
echo "Setup Xvfb..."
Xvfb $DISPLAY -screen 0 1280x720x24 -ac +extension GLX +render -noreset &

# Start x11vnc
echo "Setup x11vnc..."
x11vnc -display $DISPLAY -forever -noxdamage -shared -nopw -quiet &

# Start pipewire server
echo "Starting pipewire..."
pipewire &
wireplumber &
pipewire-pulse &

# Load the virtual sink and set it as default
echo "Setting up virtual sink..."
pactl load-module module-virtual-sink sink_name=v1
pactl set-default-sink v1

# Set the monitor of v1 sink to be the default source
pactl set-default-source v1.monitor

echo "Running VLC..."

# Run the VLC
vlc --loop --fullscreen sample-5s.mp4