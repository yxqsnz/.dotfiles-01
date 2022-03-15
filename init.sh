#!/bin/bash
echo "=> Link git"
test -d ~/.gitconfig || ln -sv $(realpath .gitconfig) ~
echo "=> Link kitty"
test -d ~/.config/kitty || ln -sv $(realpath kitty) ~/.config/kitty 
echo "=> Link Doom Emacs"
test -d ~/.doom.d || ln -sv $(realpath emacs) ~/.doom.d
