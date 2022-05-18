if ! [ -d ~/.config/zsh ]; then
  echo "[err]: can't find zsh directory, aborting."
  echo -n 'Press any key to continue... '
  read -q
  exit 1
fi
require() {
  source "$HOME/.config/zsh/$@.zsh"
}
require deps
require vars
require hist
require plugs
require omz
require alias
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
eval $(thefuck --alias)

[ -f "/home/yxqsnz/.ghcup/env" ] && source "/home/yxqsnz/.ghcup/env" # ghcup-env