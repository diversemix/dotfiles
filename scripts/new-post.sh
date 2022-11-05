#!/bin/sh
#
# Inspired by https://github.com/CalinLeafshade/dots/blob/master/bin/bin/notetaker
#
# TODO: use whiptail
#
cd "$HOME/diversemix.github.io/_posts"
TIMESTAMP=$(date -u -Iseconds)
POSTNAME="$(date -u -Iminute | tr -c '0-9T' '-'| sed -E 's/-00-00-//g' | sed -E 's/T/__/g')-new-post.md"

# Needs these lines for vim to load node successfully
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

cat << EOF > $POSTNAME
---
title: "New Post"
last_modified_at: ${TIMESTAMP}
categories:
  - blank
tags:
  - snippet
  - opinion
  - learning
  - personal
---
EOF

vim -c "norm G2o" \
  -c "norm zz" \
  -c "startinsert" $POSTNAME

whiptail --yesno "Do you wish to post now" 10 60 5 || exit 1
git add .
git commit -m "new post"
git push