#!/bin/bash
# switch between my layouts

# If an explicit layout is provided as an argument, use it. Otherwise, select the next layout from
# the set [us, ir].
layout=$(setxkbmap -query | awk 'END{print $2}')
if [ $layout = "us" ]
then setxkbmap ir
else setxkbmap us
fi
