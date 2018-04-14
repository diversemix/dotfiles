# ansible_user=peter ansible_user=peter .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export GOPATH=$HOME/go
export PATH=/usr/local/bin/:$PATH:$GOPATH/bin
export SVN_EDITOR=vim
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Assume we have dropbox installed
export TOOLBOX_DATA=~/Dropbox/app_data
. ~/dotfiles/toolbox_aliases

###################### ALIASES #####################
# Overrides
alias ls='ls --color'

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
alias vpn='sudo /etc/vpnsecure/vpnsecure'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias post-new-review='rbt post -o --guess-summary --guess-description --tracking-branch=origin/master --target-groups cdn --branch="$(git rev-parse --abbrev-ref HEAD)" "$@"'
alias git_clean_all='git clean -xfd'

# Prompt Section
# export PS1="\n\[\e[1;32m\]\w\[\e[1;31m\] [\!] \[\e[1;33m\]\$\[\e[m\] "

RESET="\[\017\]"
NORMAL="\[\033[0m\]"
RED="\[\033[31;1m\]"
YELLOW="\[\033[33;1m\]"
WHITE="\[\033[37;1m\]"
GREEN="\[\033[32;1m\]"
BLUE="\[\033[34;1m\]"
SMILEY="${GREEN}✔${NORMAL}"
FROWNY="${RED}✖${NORMAL}"
SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"

PS1="${RESET}\`${SELECT}\` ${YELLOW}\h${NORMAL}:${BLUE}\w ${YELLOW}>${NORMAL}"

# History Settings
#
HISTCONTROL=ignoreboth
shopt -s histappend

function set-title() {
    TITLE=$1
    PROMPT_COMMAND='echo -ne "\033]0;${TITLE}\007"'
}


# Finally load any local aliases
if [ -f ~/.aliases ] ; then source ~/.aliases ; fi
# EOF

# Print vital statistics...
df -h | tr -s ' ' | cut -d ' ' -f5,6 | sort -n -r | head -n 3
free | grep Mem | awk '{printf ("%2.0f%% Memory\n", $3/$2 * 100.0) }'
free | grep Swap | awk '{printf ("%2.0f%% Swap\n", $3/$2 * 100.0) }'
echo "--------------- DROPBOX: $(dropbox status)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function swap()
{
    awk '{ t = $1; $1 = $2; $2 = t; print; }'
}
