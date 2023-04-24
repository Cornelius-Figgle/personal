#!/bin/bash

backlight_device=$1
action=$2
dvalue=$3

current_value=$(cat $backlight_device)
# echo $current_value

if [[ $action = up ]]; then
	new_value=$(($current_value+$dvalue))
	echo $new_value > $backlight_device
elif [[ $action = down ]]; then
	new_value=$(($current_value-$dvalue))
	echo $new_value > $backlight_device
else
	exit 2
fi
