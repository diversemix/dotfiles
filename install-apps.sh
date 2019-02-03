#!/bin/bash

echo "  Checking for required applications... "
cat app-list | xargs sudo apt install -y

