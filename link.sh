#!/usr/bin/env bash
source "std.sh"
link "etc/doom-emacs" ~/.doom.d
link "etc/cargo.toml" ~/.cargo/config.toml
link "etc/zshrc" ~/.zshrc
link "etc/nixpkgs" ~/.config/nixpkgs
link "etc/starship.toml" ~/.config/starship.toml
link "etc/bspwm"  ~/.config/
link "etc/sxhkd"  ~/.config/
link "etc/dunst"  ~/.config/
link "etc/polybar" ~/.config/
ok "Ensuring packages,."
#ensure git exa zsh ccache lld clang curl steam amdvlk vulkan-radeon lib32-vulkan-radeon lib32-amdvlk \
#	   discord-canary firefox telegram-desktop pipewire bat asp ttf-nerd-fonts-symbols rustup \
#	   noto-fonts-cjk noto-fonts-extra ttf-joypixels lldb gdb github-cli
ensure $(cat pkgs.list)
ok "Running first run setup..."
zsh -c "source ~/.zshrc && exit"
ok "Setting Zsh as default shell for $USER."
chsh -s $(which zsh)
ok "Ensuring starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y
ok "Installing Nix..."
sh <(curl -L https://nixos.org/nix/install) --daemon
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://nixos.org/channels/nixos-unstable nixpkgs
nix-channel --update
ok "Installing Home Manager"
nix-shell '<home-manager>' -A install
