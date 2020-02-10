#!/bin/bash

echo "  Ensuring the app-list is installed...."
pushd ~/dotfiles/apps
cat app-list | xargs sudo apt install -y
popd

if [ ! -d ~/Dropbox ] ; then
    echo Please install Dropbox:
    echo "    https://www.dropbox.com/install?os=lnx"
    echo
    exit 1
fi

