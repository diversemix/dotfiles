#!/bin/sh
#
# Inspired by https://github.com/CalinLeafshade/dots/blob/master/bin/bin/notetaker
#
cd "$HOME/Dropbox/Documents/Notes/md/"
noteFilename="Notes-$(date +%Y-%m).md"

if [ ! -f $noteFilename ]; then
  echo "# Notes for $(date +%Y-%m)" > $noteFilename
fi

HEADER=$(date '+%A %d-%B, %Y')

if [ "`grep "$HEADER" $noteFilename`" != "" ]
then
  vim -c "norm G2o" \
    -c "norm zz" \
    -c "startinsert" $noteFilename
else
  vim -c "norm Go" \
    -c "norm Go## $HEADER" \
    -c "norm G2o" \
    -c "norm zz" \
    -c "startinsert" $noteFilename
fi


