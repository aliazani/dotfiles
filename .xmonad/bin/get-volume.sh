#!/bin/bash
vol_percentage=`awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master)`
mute=`awk -F "[][]"  '/Left:/ { print $4 }' <(amixer sget Master)`
if [ $mute = "off" ]
then echo "Vol: 0%"
else echo "Vol: $vol_percentage"
fi
