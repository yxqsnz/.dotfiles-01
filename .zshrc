# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


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

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
# --- Plugins --- 
zinit light zsh-users/zsh-autosuggestions # AutoSuggestions 
zinit light zsh-users/zsh-completions # Completions
zinit light zdharma-continuum/fast-syntax-highlighting # Syntax hightlight
zinit light zsh-users/zsh-history-substring-search # history
#zinit light romkatv/powerlevel10k
# --- Configuration --
export ZSH_AUTOSUGGEST_STRATEGY=(history completion) # Use History and Command Compile (Aka Tab completion) to suggest strategy
# > PATH config
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin"
# > History
export HISTFILE=
export HISTFILESIZE=
export HISTFILE=$HOME/.zhistory
export HISTFILESIZE=10000
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTTIMEFORMAT="[%F %T]" 
setopt SHARE_HISTORY
setopt HIST_FIND_NO_DUPS
setopt appendhistory
# HOME and END keys
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Aliases
alias ls="exa --icons"
