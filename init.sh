#!/bin/bash
echo "=> Link git"
test -d ~/.gitconfig || ln -sv $(realpath .gitconfig) ~
echo "=> Link kitty"
test -d ~/.config/kitty || ln -sv $(realpath kitty) ~/.config/kitty 
echo "=> Link Emacs"
test -d ~/.emacs.d || ln -sv $(realpath emacs) ~/.emacs.d
