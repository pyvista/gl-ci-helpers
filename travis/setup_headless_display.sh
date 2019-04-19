#!/bin/sh -x
sudo apt update && sudo apt install python-qt4 libgl1-mesa-glx
sudo apt-get xvfb
export DISPLAY=:99.0
export VTKI_OFF_SCREEN=True
which Xvfb
Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &
# Debugging commands:
# ls -l /etc/init.d/
# sh -e /etc/init.d/xvfb start
# give xvfb some time to start
sleep 3
