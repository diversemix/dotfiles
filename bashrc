# Source global definitions
#
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
source ~/dotfiles/bashrc-vars.sh
source ~/dotfiles/bashrc-funcs.sh
source ~/dotfiles/bashrc-prompt.sh
source ~/dotfiles/bashrc-aliases.sh
source ~/dotfiles/toolbox_aliases

# nvm when using node, make sure we set things up
#
if [ -d ~/.nvm ]
then
	export NVM_DIR="$HOME/.nvm"
	#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# History Settings
#
HISTCONTROL=ignoreboth
shopt -s histappend

# Finally load any local aliases
#
if [ -f ~/.aliases ] ; then source ~/.aliases ; fi

print_stats
