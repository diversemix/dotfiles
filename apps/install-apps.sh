#!/bin/bash

echo "  Ensuring the app-list is installed...."
cat app-list | cut -d '#' -f1 | xargs sudo apt install -y

npm i -g how-2 emoj

echo Setting up git...
git config --global user.email "diversemix@gmail.com"
git config --global user.name "diversemix"

echo "Install tab completion for docker..."
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.25.3/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

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

