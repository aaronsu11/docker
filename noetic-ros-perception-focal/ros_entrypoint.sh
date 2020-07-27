#!/bin/bash
set -e

# setup ros environment
if [ -e /opt/ros/noetic/setup.bash ] ; then
    source /opt/ros/noetic/setup.bash
else
    echo "ROS packages are not installed."
fi

exec "$@"