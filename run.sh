#!/bin/sh
dir1='./sets.md'
while inotifywait -qqre modify "$dir1"; do
    pandoc -t slidy -s sets.md -o out.html --mathjax
    sed -i 's/<head>/<head>\n  <script type="text\/javascript" src="https:\/\/livejs.com\/live.js"><\/script>/g' out.html 
done
