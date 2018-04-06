#!/bin/bash

# Setup Linux for a Virtual Machine mostly used only for development (Java, Python, C/C++, etc)

# This is a script that is used to setup an entire Linux System from scratch (mostly 
# Software, programs, and configurations cause I spend most of my time in the terminal)
# This script also spits out my configurations as mentioned above so backup yours if you
# want to (Just a warning!) 

# As of now this works with Ubuntu 16.04.4 LTS
# It has not been tested on other systems so use at your own risk

# Because Ubuntu has this broken package (libappstream3) I just purge it
# If I do need it later on, apt will anyways reinstall it as a dependency, so all's good
# You might not require the following if you are on another distro
yes | sudo apt purge libappstream3

# Initial system update and upgrade for latest packages and security upgrades
sudo apt update
yes | sudo apt upgrade

# Miscellaneous programs that I require more or less on a day to day basis
yes | sudo apt install vim zsh vlc axel git xclip gparted youtube-dl gdebi transmission apt-transport-https
yes | sudo apt install g++ python python-pip python-dev build-essential python3 python3-pip openjdk-8-jdk

# Install Sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
yes | sudo apt install sublime-text

# Spitting dotfiles into my home directory. Rarrrrrr.
cd /home/hansbala/
git clone https://www.github.com/hansbala/dotfiles.git
sudo mv dotfiles/* dotfiles/.* .
# If I don't echo all files into gitignore next time I run 'git status'
# I'll be looking at a screen of red. I'm just too lazy to do it later. Rarrr.
echo "*" > .gitignore
sudo rm -rf dotfiles

# System update and upgrade once more just to be sure
sudo apt update
yes | sudo apt upgrade