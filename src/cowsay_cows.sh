#!/bin/bash

for cow in /usr/share/cows/*.*; do echo $cow; cowsay -f $cow "hello world"; done
