#!/usr/bin/env bash
echo "[*] watching src/style.scss for changes ..."
inotifywait -r -m -e modify ./src/ | 
   while read -r _ _ _; do 
     echo " [*] compiling ..."
     sassc ./src/style.scss > style.css
   done
