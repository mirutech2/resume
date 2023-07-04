#!/bin/sh

theme=jsonresume-theme-$(jq -r ".meta.theme" resume.json)
echo $theme
npm install resumed $theme
mkdir build
cp CNAME build
./node_modules/resumed/bin/resumed.js render resume.json -o build/index.html --theme $theme
