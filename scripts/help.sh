#!/bin/sh

# Needs these lines for vim to load node successfully
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Hack - see https://github.com/junegunn/fzf.vim/issues/1231#issuecomment-774782641
vim -c "cd $HOME/diversemix.github.io/_posts" \
  -c "Ag"
#-c "autocmd VimEnter * call timer_start(0, {->execute('Ag $1')})"
