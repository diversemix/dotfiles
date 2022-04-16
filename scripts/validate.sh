#!/bin/bash

install() {
    echo checking $1...
    local binary=$2
    [ -z "$binary" ] && binary=$1
    [ -x `which $binary` ] || sudo apt install -y $1
}

exitmsg() {
    echo ${RED}✖ $* ${RESET}
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

[ -d $HOME/dotfiles ] || exitmsg "dotfiles folder not found in home"
[ -x `which notes.sh` ]  || exitmsg "dotfiles/scripts not found in path"

echo "${GREEN}✔ Validation Succeeded${RESET}"
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
