#!/bin/bash

DOT_DIR=~/dotfiles
BACKUP_DIR=~/dotfiles/old
FILE_LIST="bashrc vimrc tmux.conf"

echo
echo Installing diversemix configuration
echo -----------------------------------
echo
source ./install-apps.sh

# -----------------------------------------------------------------------------

echo -n "  Checking for backup: ${BACKUP_DIR} ... "
if [ ! -d "${BACKUP_DIR}" ] ; then
    mkdir -p ${BACKUP_DIR}
    echo Created!
else
    echo Backup folder already exists, exiting!
    ls -la  ${BACKUP_DIR}
    exit 1
fi

cd ${DOT_DIR}


for file in ${FILE_LIST}; do
    dest=~/.${file}
    echo "  Processing ${dest}... "
    if [ -h ${dest} ] ; then
        echo "    file is a symlink, skipping!"
    else
        if [ -e ${dest} ]
        then
            echo "    Backing up to ${BACKUP_DIR}... "
            mv ${dest} ${BACKUP_DIR}
        fi
        echo "    Creating symlink ${DOT_DIR}/${file} ${dest}"
        ln -s $DOT_DIR/${file} ${dest}
    fi
done

. bashrc

# -----------------------------------------------------------------------------

cd
if [ ! -d ~/Dropbox ] ; then
    echo Please install Dropbox:
    echo "    https://www.dropbox.com/install?os=lnx"
    echo
    exit 1
fi

echo ----------------------------------------------------------
echo Complete!
echo
# EOF ---------------------------------------------------------------
