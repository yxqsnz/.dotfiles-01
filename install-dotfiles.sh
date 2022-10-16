#!/usr/bin/env bash

declare -A items=(
  ["shell/.zshrc"]="${HOME}/.zshrc"
  ["shell/starship.toml"]="${HOME}/.config/starship.toml"
  ["editor/lvim"]="${HOME}/.config/lvim"
  ["app/gitconfig"]="${HOME}/.gitconfig"
)

[[ "$1" == "-y" ]] || {
  read -n 1 -p "** do you want to install these dotfiles? " install

  [[ $install == "y" ]] || {
    echo -e "\n** aborting" 
    exit 0
  }
  echo
}

for config in "${!items[@]}"; do
  out=${items[$config]}
  echo " ** linking ${config} to ${out}"
  ln -s $(realpath $config) $out 2>/dev/null || echo "    ** ignored."
done
