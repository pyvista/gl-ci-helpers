#!/bin/sh
set -x
apt update && apt install python-qt4 libgl1-mesa-glx
apt-get install -y xvfb
export DISPLAY=:99.0
export VISTA_OFF_SCREEN=True
which Xvfb
Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &
# Debugging commands:
# ls -l /etc/init.d/
# sh -e /etc/init.d/xvfb start
# give xvfb some time to start
sleep 3
set +x
