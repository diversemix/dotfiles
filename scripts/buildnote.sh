#!/bin/sh

filename=$1
target="$(dirname "${filename}")/../pdf"
outputFile="$(basename "$filename" .md).pdf"

echo " Making $outputFile"
mkdir -p $target

pandoc \
    -V 'mainfont:DejaVuSerif' \
    -V 'mainfontoptions:Extension=.ttf, UprightFont=*, BoldFont=*-Bold, ItalicFont=*-Italic, BoldItalicFont=*-BoldItalic' \
    -V 'sansfont:DejaVuSans.ttf' \
    -V 'monofont:DejaVuSansMono.ttf' \
    -V "geometry:margin=1in" \
    -o "$target/$outputFile" $filename &

