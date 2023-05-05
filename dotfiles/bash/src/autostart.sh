#!/bin/bash
# a collection of functions that run startup routines per `$HOSTNAME`


# section: hostname functions ------------------------------------------------

function quandale-butterson {
	sleep 0.1
}

function mimic3 {
	glances -s &
	/mnt/p/00\ Max/mimic/mc_start.sh &
}

function arnold-krimmler {
	sleep 0.1
}


# section: main --------------------------------------------------------------

# note: we use an artificial try/catch here
# note: catching the errors with `&&` and running the catch with `||`
# info: https://stackoverflow.com/a/22010339/19860022

{
    if ! [ $1 ]; then
		# note: allows us to pass a hostname through the cli args
		$HOSTNAME &&
	else
		$1 &&
	fi
} || {
    # save log for exception 
}
