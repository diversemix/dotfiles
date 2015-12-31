#!/bin/bash

DOT_DIR=~/dotfiles
BACKUP_DIR=~/dotfiles/old
FILE_LIST="bashrc vimrc vim"

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

