#!/bin/bash
if [ -e /opt/ros/noetic/setup.bash ] ; then
    source /opt/ros/noetic/setup.bash
else
    echo "ROS packages are not installed."
fi

if [ -e /catkin_ws/devel/setup.bash ] ; then
    source /catkin_ws/devel/setup.bash
else
    echo "Built packages are not found (in /devel)"
fi