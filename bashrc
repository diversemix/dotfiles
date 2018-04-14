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

# Print vital statistics...
#
DISK=$(df -h / | tr -s ' ' | cut -d ' ' -f5 | tail -n 1)
echo ┏━━━━━┓
echo "┃ ${DISK} ┃ Disk"
free | grep Mem | awk  '{printf ("┃ %2.0f%% ┃ Memory\n", $3/$2 * 100.0) }'
free | grep Swap | awk '{printf ("┃ %2.0f%% ┃ Swap\n", $3/$2 * 100.0) }'
echo ┗━━━━━┛
echo "DROPBOX: $(dropbox status)"
echo ""
