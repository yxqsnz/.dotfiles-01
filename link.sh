#!/usr/bin/env bash
source "std.sh"
link "etc/doom-emacs" ~/.doom.d
link "etc/cargo.toml" ~/.cargo/config.toml
link "etc/zshrc" ~/.zshrc
link "etc/nixpkgs" ~/.config/nixpkgs
link "etc/starship.toml" ~/.config/starship.toml
ok "Ensuring packages,."
ensure git
ensure exa
ensure zsh
ensure ccache
ensure lld
ensure clang
ensure curl
ensure nix
ok "Running first run setup..."
zsh -c "source ~/.zshrc && exit"
ok "Setting Zsh as default shell for $USER."
chsh -s $(which zsh)
ok "Ensuring starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo "-[NIX]-> Installing Home Mananger and adding nix unstable repository"
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://nixos.org/channels/nixos-unstable nixpkgs
nix-channel --update
echo "-[NIX]-> Installing Home Manager and switching"
nix-shell '<home-manager>' -A install
home-manager switch
