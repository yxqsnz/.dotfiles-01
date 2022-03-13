#!/bin/bash
echo "=> Link Neovim"
test -d ~/.config/nvim || ln -sv $(realpath nvim) ~/.config/nvim
echo "=> Link git"
test -d ~/.gitconfig || ln -sv $(realpath .gitconfig) ~
echo "=> Link kitty"
test -d ~/.config/kitty || ln -sv $(realpath kitty) ~/.config/kitty 
echo "=> Link KDE Globals"
test -d ~/.config/kdeglobals || ln -sv $(realpath kdeglobals) ~/.config/kdeglobals
