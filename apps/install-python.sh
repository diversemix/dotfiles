#!/bin/bash

echo "Installing python ..."
sudo apt-get install libssl-dev openssl python-pip python-venv virtualenvwrapper

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
for ver in 5 6 7 8 
do
  sudo apt install python3.$ver python3.$ver-dev
done

