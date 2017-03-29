# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH=/usr/local/bin/:$PATH
export SVN_EDITOR=vim

# Assume we have dropbox installed
export TOOLBOX_DATA=~/Dropbox/app_data
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
alias dm='gnome-terminal -e "ssh -R 2222:127.0.0.1:22 peter@diversemix.com"'

function topmem() 
{
    ps -eo size,pid,user,command --sort -size | \
        awk '{ hr=$1/1024 ; printf("%13.2f Mb ",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf("%s" , $x) } print "" }' | \
        head

}

# Docker
alias dp="docker ps -a"
alias di="docker images"
alias ds=" docker ps -q | xargs docker inspect --format '{{ .Name }} {{ .Config.Image }} {{ .NetworkSettings.IPAddress }} {{ .Config.Cmd }} {{ .Config.ExposedPorts }}'"
alias docker_stopall="docker ps -q|xargs docker stop"
alias docker_rmall="docker ps -a -q|xargs docker rm"
alias docker_rmnone="docker images | grep none| tr -s ' '| cut -d ' ' -f3 | xargs docker rmi"

# Aliases - General
alias uniq_ext='find . -name '\''*.*'\'' -print | rev | cut -d . -f1 | rev | sort | uniq'
alias load_me='for i in 1 2 3 4; do while : ; do : ; done & done'

export PS1="\n\[\e[1;32m\]\w\[\e[1;31m\] [\!] \[\e[1;33m\]\$\[\e[m\] "

#http://unix.stackexchange.com/questions/18212/bash-history-ignoredups-and-erasedups-setting-conflict-with-common-history/18443
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

function set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}


# Finally load any local aliases
if [ -f ~/.aliases ] ; then source ~/.aliases ; fi
# EOF

# Print vital statistics...
df -h | tr -s ' ' | cut -d ' ' -f5,6 | sort -n -r | head -n 3
free | grep Mem | awk '{printf ("%2.0lf%% Memory\n", $3/$2 * 100.0) }'
free | grep Swap | awk '{printf ("%2.0lf%% Swap\n", $3/$2 * 100.0) }'
echo "--------------- DROPBOX: $(dropbox status)"

function swap()
{
    awk '{ t = $1; $1 = $2; $2 = t; print; }'
}
