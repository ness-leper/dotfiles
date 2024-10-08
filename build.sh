#!/bin/bash

# Building i3
sudo apt install xorg xinit -y
sudo apt install git make gcc autoconf -y
sudo apt install libpango1.0-dev libyajl-dev libstartup-notification0-dev libev-dev libtool libxkbcommon-dev libxkbcommon-x11-dev libxcb1-dev libxcb-randr0-dev libxcb-util0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxcb-shape0-dev libxcb-xrm-dev xutils-dev -y
sudo apt install i3 -y
touch ~/.xinitrc
echo "exec /usr/bin/i3" >> ~/.xinitrc

# Installing a terminal emulator
sudo apt install alacritty
