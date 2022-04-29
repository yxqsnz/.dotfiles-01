red="\e[31m"
green="\e[32m"
end="\e[0m"
ok() {
  echo -e "[${green}🗸${end}] $@"
}
err() {
  echo -e "[${red}✘${end}] $@"
}

link() {
  if [[ "${FORCE_UNLINK}" == '1' ]]; then
    unlink $2 2>/dev/null
  fi
  if ln -s $(realpath $1) $2 2>/dev/null; then
    ok "linked $1 into $2."
  else
    err "failed to link $1."
    printf "unlink directory? "
    if zsh -c read -q; then
      unlink $2 2>/dev/null
    fi

  fi
}
ensure() {
  paru -S $@ || yay -S $@ || sudo pacman -S $@
}


