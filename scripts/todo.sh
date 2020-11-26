#!/bin/bash

CMD="gh -R diversemix/tech-journal issue"
if (( $# == 0 )); then
  ${CMD} list
  exit 0
fi

if (( $# == 1 )); then
  if [ $1 == "add" ]; then
    ${CMD} create -p tech-journal
  fi
  if [ $1 == "view" ]; then
    sensible-browser https://github.com/diversemix/tech-journal/projects/1
  fi
  ${CMD} view $1
fi

if (( $# == 2 )); then
  if [ $1 == "addjira" ]; then
    ${CMD} create -t "$2" -b "https://simprints.atlassian.net/browse/$2" -l important -l urgent -p tech-journal
  fi
  if [ $1 == "close" ]; then
    ${CMD} close $2
  fi
fi

