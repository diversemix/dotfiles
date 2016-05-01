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
            yum install fuse-encfs
        else
            yum install ${app} 
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

git clone https://github.com/galmeidadavid/bash-colorize.git
sudo ln -s $PWD/bash-colorize/colorize /usr/local/bin/colorize

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

echo "  Setting up ViM ... please be patient!"
VIM_DIR=~/.vim

if [ ! -d ${VIM_DIR} ] ; then mkdir ~/.vim/ ; fi
cd ~/.vim/

if [ ! -f colors/gruvbox.vim ] ; then
    echo "  Install color scheme for vim..."
    mkdir -p colors
    git clone https://github.com/morhetz/gruvbox.git
    cp -rf gruvbox/colors/gruvbox.vim ./colors/
fi

if [ ! -d bundle/Vundle.vim ] ; then
    # Install Vundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginUpdate +qall
fi

# -----------------------------------------------------------------------------

cd
if [ ! -d ~/toolbox ] ; then 
    git clone git@github.com:diversemix/toolbox.git 
fi
echo
echo ----------------------------------------------------------
echo Complete!
echo
echo To mount the toolbox use: 'toolbox_mount'

echo
# EOF ---------------------------------------------------------------
