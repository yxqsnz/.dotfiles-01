#! /usr/bin/env bash
source "std.sh"
ok "Ensuring packages,."
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
