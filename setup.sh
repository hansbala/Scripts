#!/bin/bash

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

# Spotify installation using repository (I still prefer this over using snaps)
# Maybe in the future I'll port over applications that use snaps but until then ...
yes | sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
yes | sudo apt install spotify-client

# Install the Remmina Desktop client (I use the RDP protocol to manage a couple 
# of client remote servers; so, it is a necessity for me)
yes | sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sudo apt-get update
yes | sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret

# Install Google Chrome
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi -n google-chrome-stable_current_amd64.deb

# Install Sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
yes | sudo apt install sublime-text

# Install PopCornTime by downloading it and extracting it to ~/Videos/PopCornTime/
cd /tmp
wget https://get.popcorntime.sh/build/Popcorn-Time-0.3.10-Linux-64.tar.xz
mkdir -p ~/Videos/PopCornTime
sudo tar -xf Popcorn-Time-*.tar.xz -C ~/Videos/PopCornTime

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

