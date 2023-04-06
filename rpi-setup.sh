#!/bin/bash

# this is more intended as a command reference, but ig it could be ran directly

sudo apt update && sudo apt install git neofetch neovim thefuck python3-pip python3-venv
exec bash
git --version
neofetch --version
nvim --version
python --version
python3 --version
python3 -m pip --version
pip --version
   
ls -lash
mkdir source && cd source
git clone https://github.com/Cornelius-Figgle/personal.git
git clone https://github.com/Cornelius-Figgle/ROSA.git

ls /tmp
mv ~/.bashrc /tmp && mv ~/.profile /tmp  # into the abyss...
ln -s /home/max/source/personal/dotfiles/bash/.bashrc /home/max/.bashrc
ln -s /home/max/source/personal/dotfiles/bash/.profile /home/max/.profile
ls -lash
exec bash

# curl -sSL https://install.python-poetry.org | python3 -