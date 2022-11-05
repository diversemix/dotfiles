#!/bin/sh
#
# Inspired by https://github.com/CalinLeafshade/dots/blob/master/bin/bin/notetaker
#
cd "$HOME/Dropbox/Documents/Notes/md/"
noteFilename="Notes-$(date +%Y-%m).md"

# Needs these lines for vim to load node successfully
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

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


