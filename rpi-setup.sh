#!/bin/bash
# this is more intended as a command reference, but ig it could be ran directly


# installs
sudo apt update
sudo apt install git neofetch neovim thefuck python3-pip python3-venv  # long
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
poetry install