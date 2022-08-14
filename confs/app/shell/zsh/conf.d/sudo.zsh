export SUDO_PROMPT=$(printf "\u001b[32m [=]  Password: \u001b[0m")

sudo() {
  if [ "$1" = "nvim" ]; then
    shift
    sudoedit $@
  else
    /usr/bin/sudo -p "${SUDO_PROMPT}" $@
  fi
}

