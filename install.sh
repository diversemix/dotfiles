#!/bin/bash

DOT_DIR=~/dotfiles
BACKUP_DIR=~/dotfiles/old
FILE_LIST="bashrc vimrc vim tmux.conf"

# ------------------------------------------------------------

# Check for git

# Check for vim

# Check for other stuff

# ------------------------------------------------------------

echo -n "  Creating ${BACKUP_DIR} ..."
mkdir -p ${BACKUP_DIR}
echo done.

cd ${DOT_DIR}

echo "  Moving existing dotfiles in ${HOME} to ${BACKUP_DIR} "
for file in ${FILE_LIST}; do
    mv ~/.$file ${BACKUP_DIR}
    echo "    Creating symlink ${DOT_DIR}/${file} ~/.${file}"
    ln -s $DOT_DIR/${file} ~/.${file}
done

# Install color scheme for vim
cd ~/.vim/
mkdir -p colors
git clone https://github.com/morhetz/gruvbox.git
cp -rf gruvbox/colors/gruvbox.vim ./colors/

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
