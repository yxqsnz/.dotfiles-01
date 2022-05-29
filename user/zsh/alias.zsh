alias ls='exa --icons --long'
alias icat='kitty +kitten icat'
_TH=$(command -v thefuck)
eval $($_TH --alias)
GRC_ALIASES=true
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

