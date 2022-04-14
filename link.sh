#!/usr/bin/env bash
source "std.sh"
link "etc/doom-emacs" ~/.doom.d
link "etc/cargo.toml" ~/.cargo/config.toml
link "etc/gitconfig" ~/.gitconfig
link "etc/zshrc" ~/.zshrc
link "etc/nixpkgs" ~/.config/nixpkgs
link "etc/starship.toml" ~/.config/starship.toml
ensure git
ensure exa
ensure zsh
ensure ccache
ensure lld
ensure clang
ok "Running first run setup..."
zsh -c "source ~/.zshrc && exit"
ok "Setting Zsh as default shell for $USER."
chsh -s $(which zsh)
ok "Ensuring starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y
