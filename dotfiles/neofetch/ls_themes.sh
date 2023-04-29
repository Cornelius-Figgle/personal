#!/bin/bash

for conFile in ~/.config/neofetch/neofetch-themes/**/*.*; do echo $conFile; neofetch --config $conFile; done
