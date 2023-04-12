#!/bin/bash
# this is more intended as a command reference, but ig it could be ran directly


# installs
sudo apt update
sudo apt install git gh neofetch neovim thefuck  # programs
sudo apt install python3-pip python3-venv  # pip
curl -sSL https://install.python-poetry.org | python3 -  # poetry being difficult, as usual
poetry config virtualenvs.in-project true  # don't forget me
exec bash  # reload $PATH

# check versions (ie installs went fine)
git --version
neofetch --version
nvim --version
python --version
python3 --version
python3 -m pip --version
pip --version
poetry --version
gh --version

# gh auth
gh auth login  # follow setup (use key)
git auth setup-git
git config --global user.email "max@fullimage.net"
git config --global user.name "Cornelius-Figgle"
exec bash  # reload $PATH

# gh clones 
ls -lash
mkdir source && cd source
git clone https://github.com/Cornelius-Figgle/personal.git
git clone https://github.com/Cornelius-Figgle/ROSA.git

# settings up bash configs (symlinks)
ls /tmp
mv ~/.bashrc /tmp && mv ~/.profile /tmp  # into the abyss...
ln -s /home/max/source/personal/dotfiles/bash/.bashrc /home/max/.bashrc
ln -s /home/max/source/personal/dotfiles/bash/.profile /home/max/.profile
ls -lash
exec bash

# install ROSA
cd ~/source/ROSA
ls
sudo apt install python3-sdl2  # sdl2 for pygame 
sudo apt install python3-pyaudio flac python3-gst-1.0  # python copy no worky
poetry installpoetry
