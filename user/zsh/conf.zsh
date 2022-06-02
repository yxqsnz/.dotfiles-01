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
require alias
require prompt
autoload -U compinit     && compinit
autoload -U bashcompinit && bashcompinit
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';
zstyle :compinstall filename "$HOME/.config/zsh/conf.zsh"
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
[ -f "/home/yxqsnz/.ghcup/env" ] && source "/home/yxqsnz/.ghcup/env" # ghcup-env

