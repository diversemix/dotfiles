#!/bin/sh

# Hack - see https://github.com/junegunn/fzf.vim/issues/1231#issuecomment-774782641
vim -c "cd $HOME/Dropbox/Documents/Notes/md/" \
  -c "autocmd VimEnter * call timer_start(0, {->execute('Ag $1')})"
