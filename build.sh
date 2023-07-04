#!/bin/sh

theme=jsonresume-theme-$(jq -r ".meta.theme" resume.json)
echo $theme
npm install resumed $theme
mkdir build
cp CNAME build
./node_modules/resumed/bin/resumed.js render resume.json -o build/index.html --theme $theme

# Replace image
sed -i 's/?s=100/?s=512/g' build/index.html
