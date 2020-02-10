#!/bin/bash

read -p "This may overwrite your vimrc file. Are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ln -s ${HOME}/dotfiles/diversemix.vimrc ${HOME}/.vimrc || exit 1
fi

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
