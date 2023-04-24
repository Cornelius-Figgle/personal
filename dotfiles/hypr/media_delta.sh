#!/bin/bash


# cli args
op=$1  # {vol|mute|mic|bright|pwr}
offset=$2  # {up|down|toggle}
value=$3  # <any>

# vars
sink=@DEFAULT_SINK@

# main logic
function vol {
	if [[ $offset = up ]]; then
		pactl set-sink-volume $sink "+${value}%"
	elif [[ $offset = down ]]; then
		pactl set-sink-volume $sink "-${value}%"
	else
		exit 2
	fi
}

function mute {
	# always just toggles it, no matter what $offset is
	pactl set-sink-mute $sink toggle
}

function mic {
	# always just toggles it, no matter what $offset is
	pactl set-sink-input-mute $sink toggle
}

function bright {
	device=/sys/class/backlight/intel_backlight/brightness
	cur_value=$(cat $device)
	if [[ $offset = up ]]; then
		value=$(($cur_value+$value))
	        echo $value > $device
	elif [[ $offset = down ]]; then
                value=$(($cur_value-$value))
                echo $value > $device
	else
		exit 2
	fi
}

function pwr {
	# this deserves to be kept seperate
	# also I didn't write it anyways
	~/.config/waybar/scripts/powermenu.sh
}

# runner
$op  # calls the function with the name $op
