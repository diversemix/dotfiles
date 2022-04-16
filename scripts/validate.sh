#!/bin/bash

print_good() { 
    echo ${GREEN}✔ $* ${RESET} 
}

print_bad() { 
    echo ${RED}✖  $* ${RESET} 
}

install() {
    echo -n checking $1...
    local binary=$2
    [ -z "$binary" ] && binary=$1
    which $binary > /dev/null && print_good || print_bad sudo apt install -y $1
}

exitmsg() {
    print_bad $*
    exit 1
}

clear
echo Validating my environment...
echo ""
install ack
install batcat bat 
install build-essential gcc
install conky-all conky
install diodon
install figlet
install firefox
install fzf
install git
install jq
install keepassx
install lolcat
install make
install meld
install net-tools netstat
install openssh-client ssh
install openssl
install ranger
install silversearcher-ag ag
install tcpdump
install tmux
install vim-athena vim
install w3m

echo ""
echo Checking environment dotfiles
echo ""

[ -d $HOME/dotfiles ] && print_good Found dotfiles folder || exitmsg "dotfiles folder not found in home"
[ -x `which notes.sh` ] && print_good Found scripts on PATH || exitmsg "dotfiles/scripts not found in path"

exit 0

# -------------------------------------------------------------
# Other useful installs 
#
# google-chrome-stable
# octave
# kdenlive
# kazam
# audacity
# gimp
# docker-ce
# docker-ce-cli
# i3
# imagemagick
#
# nodejs
# npm
# w3m
# w3m-img
# youtube-dl
# zathura
