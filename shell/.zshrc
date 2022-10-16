# Zpm
if [[ ! -f ~/.zpm/zpm.zsh ]]; then
  git clone --recursive https://github.com/zpm-zsh/zpm ~/.zpm
  echo "---------------"
  echo "  [*] Run 'zpm clean' after this!"
  echo "---------------"
fi
source ~/.zpm/zpm.zsh

# Paths
export DENO_INSTALL="/home/yxqsnz/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Plugins
zpm load                      \
  zpm-zsh/core-config         \
  zpm-zsh/ignored-users,async \
  zpm-zsh/check-deps,async    \
  zpm-zsh/colorize,async      \
  zpm-zsh/ssh,async           \
  zpm-zsh/dot,async           \
  zpm-zsh/undollar,async

zpm load                          \
  zpm-zsh/dropbox,apply:path:fpath           \
  zpm-zsh/zsh-better-npm-completion,async    \
  \
  zpm-zsh/clipboard                          \
  zpm-zsh/bookmarks,async                    \
  voronkovich/gitignore.plugin.zsh,async     \
  zpm-zsh/autoenv,async                      \
  \
  mdumitru/fancy-ctrl-z,async                \
  zpm-zsh/zsh-history-substring-search,async \
  zsh-users/zsh-autosuggestions,async        \
  zdharma-continuum/fast-syntax-highlighting,async     \
  zpm-zsh/history-search-multi-word,as

# Aliases
alias ls='exa --icons --long'

# Prompt
 eval $(starship init zsh)

