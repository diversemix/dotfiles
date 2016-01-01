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

# Aliases - General
alias uniq_ext='find . -name '\''*.*'\'' -print | rev | cut -d . -f1 | rev | sort | uniq'
alias open_fw=update_fw


# Aliases - Docker
alias docker_stopall="docker ps -q|xargs docker stop"
alias docker_rmall="docker ps -a -q|xargs docker rm"
