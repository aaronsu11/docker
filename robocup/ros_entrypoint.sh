#!/bin/bash
set -e

if [ -e /etc/bash.bashrc ] ; then
    source /etc/bash.bashrc
else
    echo "bashrc not found."
fi

# setup ros environment
if [ -e /opt/ros/noetic/setup.bash ] ; then
    source /opt/ros/noetic/setup.bash
else
    echo "ROS packages are not installed."
fi

exec "$@"