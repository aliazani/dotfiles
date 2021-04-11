#!/bin/bash
touchpad_on_or_off=`xinput --list-props "ELAN1200:00 04F3:3045 Touchpad" | awk '/Device Enabled/ { print $4 }'`
if [ $touchpad_on_or_off -eq 0 ]
then `xinput enable "ELAN1200:00 04F3:3045 Touchpad"`
else `xinput disable "ELAN1200:00 04F3:3045 Touchpad"`
fi
