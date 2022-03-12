#!/bin/bash
echo "=> Link Neovim"
test -d ~/.config/nvim || ln -sv $(realpath nvim) ~/.config/nvim
echo "=> Link git"
test -d ~/.config/nvim || ln -sv $(realpath .gitconfig) ~ 
