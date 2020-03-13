#!/bin/bash

echo "Installing python ..."
sudo apt-get install libssl-dev openssl python-pip python-venv virtualenvwrapper virtualenv

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
for ver in 5 6 7 8 
do
  sudo apt install python3.$ver python3.$ver-dev
done

sudo pip2 install virtualenvwrapper
sudo pip3 install virtualenvwrapper

echo "Setting up virual envs..."
export VE=${HOME}/.virtualenvs
mkdir $VE

