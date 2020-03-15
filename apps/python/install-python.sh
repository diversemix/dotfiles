#!/bin/bash

echo "Installing python ..."
sudo apt-get install libssl-dev openssl python-pip python3-pip python-venv virtualenvwrapper virtualenv

for ver in 5 6 7 8 
do
  sudo apt install python3.$ver python3.$ver-dev
done

pip2 install virtualenvwrapper
pip3 install virtualenvwrapper

echo "Setting up virual envs..."
export VE=${HOME}/.virtualenvs
mkdir $VE

