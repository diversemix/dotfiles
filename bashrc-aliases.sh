
source ~/dotfiles/bashrc-vars.sh
source ~/dotfiles/bashrc-funcs.sh
source ~/dotfiles/bashrc-prompt.sh
source ~/dotfiles/toolbox_aliases

browse_to() {
	/opt/google/chrome/chrome $1$2
}

cheatsheet() {
	browse_to "https://duckduckgo.com/?q=cheatsheet+$1&ia=cheatsheet&iax=1"
}

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
alias xo=xdg-open
alias dm='gnome-terminal -e "ssh -R 2222:127.0.0.1:22 peter@diversemix.com"'
alias va='vi ~/.bash_aliases ; source ~/.bash_aliases'
alias ve='vi ~/dotfiles/elife-aliases ; source ~/.bash_aliases'

# Git aliases
alias gl="git log --oneline --graph --decorate --all"
alias glf="git log --oneline --name-only"
alias gs='git status -sb'

# Docker
alias dp="docker ps -a"
alias di="docker images"
alias ds=" docker ps -q | xargs docker inspect --format '{{ .Name }} {{ .Config.Image }} {{ .NetworkSettings.IPAddress }} {{ .Config.Cmd }} {{ .Config.ExposedPorts }}'"
alias docker_stopall="docker ps -q|xargs docker stop"
alias docker_rmall="docker ps -a -q|xargs docker rm"
alias docker_rmnone="docker images | grep none| tr -s ' '| cut -d ' ' -f3 | xargs docker rmi"
alias dc=docker-compose

# Aliases - General
alias uniq_ext='find . -name '\''*.*'\'' -print | rev | cut -d . -f1 | rev | sort | uniq'
alias load_me='for i in 1 2 3 4; do while : ; do : ; done & done'
alias vpn='sudo /etc/vpnsecure/vpnsecure'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias post-new-review='rbt post -o --guess-summary --guess-description --tracking-branch=origin/master --target-groups cdn --branch="$(git rev-parse --abbrev-ref HEAD)" "$@"'
alias git_clean_all='git clean -xfd'
alias longest_jsfiles='for f in $(git ls-tree --name-only -r HEAD | grep js$); do  cat $f | wc -l ; echo $f; done | paste -d "," - -  | sort -n'

#Cheat sheets
alias cs='cheatsheet'

source ~/dotfiles/elife-aliases
