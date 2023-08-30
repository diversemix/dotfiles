#!/bin/sh
#
# Inspired by https://github.com/CalinLeafshade/dots/blob/master/bin/bin/notetaker
#
#
cd "$HOME/Sync/diversemix.github.io/_posts"

TITLE=$(whiptail --inputbox "Enter the post's title:" 10 60 3>&1 1>&2 2>&3)

set -x
if [ ! -z "${TITLE}" ]
then

POSTNAME="$(echo -n $(date -u -I) ${TITLE}|tr -c '[A-z,0-9]' '-').md"
TIMESTAMP=$(date -u -Iseconds)

cat << EOF > $POSTNAME
---
title: "${TITLE}"
last_modified_at: ${TIMESTAMP}
categories:
  - Technical
  - People
  - Learning
  - Interest
tags:
  - setup
  - python
  - communication
---
EOF
code --goto ${POSTNAME}:99999 .

else
  code .
fi

#vim -c "norm G2o" \
  #-c "norm zz" \
  #-c "startinsert" $POSTNAME

#whiptail --yesno "Do you wish to post now" 10 60 5 || exit 1
#git add .
#git commit -m "new post"
#git push
