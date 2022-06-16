alias ls='exa --icons --long'
alias icat='kitty +kitten icat'
alias l='ls'
_TH=$(command -v thefuck)
[[ -z $_TH ]] && export _TH=":"
eval $($_TH --alias)
GRC_ALIASES=true
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

