#!/bin/bash

echo "  Ensuring the app-list is installed...."
cat app-list | cut -d '#' -f1 | xargs sudo apt install -y

echo Setting up git...
git config --global user.email "diversemix@gmail.com"
git config --global user.name "diversemix"

echo Installing bat...
export VER="0.12.1"
wget https://github.com/sharkdp/bat/releases/download/v${VER}/bat_${VER}_amd64.deb
sudo dpkg -i bat_${VER}_amd64.deb

echo Ensuring you can run docker without root access...
sudo usermod -aG docker ${USER}
echo *** YOU NEED TO LOGIN AGAIN ***



if [ ! -d ~/Dropbox ] ; then
    echo 
    echo ..... Want Dropbox? ....
    echo Please install Dropbox:
    echo "    https://www.dropbox.com/install?os=lnx"
    echo
    exit 1
fi

