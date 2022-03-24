#!/bin/bash
echo "=> Link Zsh"
test -f ~/.zshrc || ln -sv $(realpath .zshrc) ~/.zshrc
echo "=> Link Power level 10k Configuration"
test -f ~/.p10k.zsh || ln -s $(realpath zsh/.p10k.zsh) ~/.p10k.zsh
echo "=> Link git"
test -f ~/.gitconfig || ln -sv $(realpath .gitconfig) ~/.gitconfig
echo "=> Link kitty"
test -d ~/.config/kitty || ln -sv $(realpath kitty) ~/.config/kitty 
echo "=> Link Doom Emacs"
test -d ~/.doom.d || ln -sv $(realpath .doom.d) ~/.doom.d
echo "=> Link Cargo config"
test -f ~/.cargo/config.toml || ln -sv $(realpath cargo-config.toml) ~/.cargo/config.toml
echo "=> Link Bspwm"
test -d ~/.config/bspwm || ln -sv $(realpath bspwm) ~/.config/bspwm
echo "=> Link Polybar"
test -d ~/.config/polybar || ln -sv $(realpath polybar) ~/.config/polybar
echo "=> Link Sxhkd"
test -d ~/.config/sxhkd || ln -sv $(realpath sxhkd) ~/.config/sxhkd
echo "=> Link Rofi"
test -d ~/.config/rofi || ln -sv $(realpath rofi) ~/.config/rofi
echo "=> Link Picom"
test -d ~/.config/picom || ln -sv $(realpath picom) ~/.config/picom
echo "=> Link Alacritty"
test -d ~/.config/alacritty || ln -sv $(realpath alacritty) ~/.config/alacritty
echo "=> Copy Paru (ROOT)"
sudo cp -v $(realpath paru.conf) /etc/paru.conf

