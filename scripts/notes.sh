#!/bin/sh
#
cd "$HOME/Sync/Notes"
noteFilename="Notes-$(date +%Y-%m).md"

# Look for the file - if not there create one
if [ ! -f ${noteFilename} ]; then
  echo "# Notes for $(date +%Y-%m)" > ${noteFilename}
fi

# Look for this header - if not there then add at end
HEADER=$(date '+%A %d-%B, %Y')
FOUND=$(grep "$HEADER" ${noteFilename})

if [ -z "${FOUND}" ]
then
  echo Adding header
  echo "" >> ${noteFilename}
  echo "" >> ${noteFilename}
  echo "## ${HEADER}" >> ${noteFilename}
  echo "" >> ${noteFilename}
fi

echo "" >> ${noteFilename}
code --goto ${noteFilename}:99999 .
