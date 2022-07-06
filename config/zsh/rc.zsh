# vim: foldmethod=marker foldmarker=#region,#endregion
#region Xorg
[ "$TTY" = "/dev/tty1" ] && startx
#endregion
#region Zinit
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
#endregion
#region Options
setopt interactive_comments hist_ignore_dups  octal_zeroes   no_prompt_cr
setopt no_hist_no_functions no_always_to_end  append_history list_packed
setopt inc_append_history   complete_in_word  no_auto_menu   auto_pushd
setopt pushd_ignore_dups    no_glob_complete  no_glob_dots   c_bases
setopt numeric_glob_sort    no_share_history  promptsubst    auto_cd
setopt rc_quotes            extendedglob      notify
#endregion
#region Plugins
zinit ice depth "1" # git clone depth
zinit light romkatv/powerlevel10k
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light hlissner/zsh-autopair
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zinit light zsh-users/zsh-autosuggestions
#endregion
#region Aliases
alias htop=btm
alias ls='exa --icons --long'
alias vim=nvim
alias editor=nvim
#endregion
#region Home+End keys
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
#endregion
#region History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
#endregion
#region Path Configuration
export PATH="$HOME/bin:$PATH"
export PATH="/usr/sbin:$PATH"
#endregion
#region Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
#endregion
autopair-init

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
