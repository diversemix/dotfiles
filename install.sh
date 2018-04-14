#!/bin/bash

DOT_DIR=~/dotfiles
BACKUP_DIR=~/dotfiles/old
FILE_LIST="bashrc vimrc tmux.conf"
REQ_APPS="git vim tmux encfs ack"

echo
echo Installing diversemix configuration
echo -----------------------------------
echo
echo "  Checking for required applications... "
for app in ${REQ_APPS}; do
    if [ -z $(which ${app}) ]
    then
        if [ ${app} == "encfs" ] ; then
            dnf install fuse-encfs
        else
            dnf install ${app}
        fi
    else
        echo "    Found ${app}"
    fi
done

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

#git clone https://github.com/galmeidadavid/bash-colorize.git
#sudo ln -s $PWD/bash-colorize/colorize /usr/local/bin/colorize

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

echo
echo "Don't forget: atom, node, etc..."
echo ----------------------------------------------------------
echo Complete!
echo
# EOF ---------------------------------------------------------------
