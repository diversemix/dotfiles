# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

tool_search() {
    echo
    ack -i ~/toolbox/pocket --heading --break --match $1 | cut -d '|' -f2- | sed -e "s/\\\/\n/g"
}

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
alias ts=tool_search


# Aliases - General
alias uniq_ext='find . -name '\''*.*'\'' -print | rev | cut -d . -f1 | rev | sort | uniq'
alias toolbox_mount='encfs ~/toolbox/pocket_enc ~/toolbox/pocket'
alias toolbox_umount='fusermount -u ~/toolbox/pocket'

# Aliases - Docker
alias docker_stopall="docker ps -q|xargs docker stop"
alias docker_rmall="docker ps -a -q|xargs docker rm"

export PS1="\n\[\e[1;32m\]\w\[\e[1;31m\] [\!] \[\e[1;33m\]\$\[\e[m\] "
