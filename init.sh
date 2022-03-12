#!/bin/bash
echo "=> Link Neovim"
ln -sv $(realpath nvim) ~/.config/nvim 
echo "=> Link git"
ln -sv $(realpath .gitconfig) ~
