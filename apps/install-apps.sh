#!/bin/bash

echo "  Ensuring the app-list is installed...."
cat app-list | cut -d '#' -f1 | xargs sudo apt install -y

if [ ! -d ~/Dropbox ] ; then
    echo Please install Dropbox:
    echo "    https://www.dropbox.com/install?os=lnx"
    echo
    exit 1
fi

