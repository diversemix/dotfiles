#!/bin/sh
#
# Inspired by https://github.com/CalinLeafshade/dots/blob/master/bin/bin/notetaker
#
noteFilename="$HOME/Dropbox/Documents/Notes/md/Notes-$(date +%Y-%m).md"

if [ ! -f $noteFilename ]; then
  echo "# Notes for $(date +%Y-%m)" > $noteFilename
fi

vim -c "norm Go" \
  -c "norm Go## $(date '+%A %d-%B, %Y %H:%M')" \
  -c "norm G2o" \
  -c "norm zz" \
  -c "startinsert" $noteFilename

