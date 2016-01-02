# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

update_fw() { 
	firewall-cmd --zone=public --add-port=$@/tcp --permanent; 
	firewall-cmd --reload ;
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

# Aliases - General
alias uniq_ext='find . -name '\''*.*'\'' -print | rev | cut -d . -f1 | rev | sort | uniq'
alias open_fw=update_fw


# Aliases - Docker
alias docker_stopall="docker ps -q|xargs docker stop"
alias docker_rmall="docker ps -a -q|xargs docker rm"

export PS1="\n\[\e[1;32m\]\w\[\e[1;31m\] [\!] \[\e[1;33m\]\$\[\e[m\] "
