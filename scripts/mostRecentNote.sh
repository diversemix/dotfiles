#!/bin/bash

ls -r ~/Dropbox/Documents/Notes/pdf/*.pdf | head -n1 | xargs xdg-open &
disown -a
