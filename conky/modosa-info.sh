#!/bin/bash

echo "=========================== GIT ========================== "
cat /tmp/last_git
echo "========================= DOCKER ========================= "
docker ps -a --format "{{.Status}}|{{.Image}}"
