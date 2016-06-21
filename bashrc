# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH=/usr/local/bin/:$PATH
export SVN_EDITOR=vim
export TOOLBOX_DATA=~/Dropbox/app_data
export TOOLBOX=~/toolbox

# Assume we are cloned into ~/toolbox
. ~/dotfiles/toolbox_aliases

# Single letter aliases...
alias l="ls -ltrh $*"
alias a="alias"
alias s="systemctl $*"
alias j="journalctl $*"
alias v="vim $*"
alias i="ifconfig $*"
alias n="netstat -lpn"
alias p="ps aux"
alias h="history $*"
alias f="free -mh $*"
alias c='top -d 0.5 -bn3 | grep "%Cpu(s)" | cut -d ',' -f4 | awk "{print 100 - $1"% Cpu Load"}" | tail -n 1'

# Double letter aliases...
alias dm="ssh diversemixcom@diversemix.com"

# Docker
alias dp="docker ps -a"
alias di="docker images"
alias ds=" docker ps -q | xargs docker inspect --format '{{ .Name }} {{ .Config.Image }} {{ .NetworkSettings.IPAddress }} {{ .Config.Cmd }} {{ .Config.ExposedPorts }}'"
alias docker_stopall="docker ps -q|xargs docker stop"
alias docker_rmall="docker ps -a -q|xargs docker rm"
alias topmem-"ps -eo size,pid,user,command --sort -size | awk '{ hr=/1024 ; printf(%13.2f Mb ,hr) } { for ( x=4 ; x<=NF ; x++ ) { printf(%s ,) } print  }' | head"

# Aliases - General
alias uniq_ext='find . -name '\''*.*'\'' -print | rev | cut -d . -f1 | rev | sort | uniq'

export PS1="\n\[\e[1;32m\]\w\[\e[1;31m\] [\!] \[\e[1;33m\]\$\[\e[m\] "

# Finally load any local aliases
if [ -f ~/.aliases ] ; then source ~/.aliases ; fi
# EOF
