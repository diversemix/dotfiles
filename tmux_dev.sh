#!/bin/bash
tmux new-session -d -s dev -n ide vim
tmux split-window -v -p 10 -t dev
tmux select-pane -t 1
tmux split-window -h -p 30 -t dev
tmux select-window -t dev:1
tmux select-pane -t 1
tmux -2 attach-session -d
