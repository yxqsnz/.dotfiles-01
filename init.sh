#!/bin/bash
echo "=> Link git"
test -f ~/.gitconfig || ln -sv $(realpath .gitconfig) ~/.gitconfig
echo "=> Link kitty"
test -d ~/.config/kitty || ln -sv $(realpath kitty) ~/.config/kitty 
echo "=> Link Doom Emacs"
test -d ~/.doom.d || ln -sv $(realpath .doom.d) ~/.doom.d
