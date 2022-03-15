#!/bin/bash
echo "=> Link git"
test -d ~/.gitconfig || ln -sv $(realpath .gitconfig) ~
echo "=> Link kitty"
test -d ~/.config/kitty || ln -sv $(realpath kitty) ~/.config/kitty 
