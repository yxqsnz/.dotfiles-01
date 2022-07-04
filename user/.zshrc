# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Deps {{
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
# }}
# Env Vars {{ 
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
# }}
# Aditional Paths {{
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"
export PATH="/home/yxqsnz/.deno/bin:$PATH"
export PATH="$PATH:/home/yxqsnz/Documents/Scripts/Bin"
# }}
#History (From OMZ) {{
## History wrapper
function omz_history {
  local clear list
  zparseopts -E c=clear l=list

  if [[ -n "$clear" ]]; then
    # if -c provided, clobber the history file
    echo -n >| "$HISTFILE"
    fc -p "$HISTFILE"
    echo >&2 History file deleted.
  elif [[ -n "$list" ]]; then
    # if -l provided, run as if calling `fc' directly
    builtin fc "$@"
  else
    # unless a number is provided, show all history events (starting from 1)
    [[ ${@[-1]-} = *[0-9]* ]] && builtin fc -l "$@" || builtin fc -l "$@" 1
  fi
}

# Timestamp format
case ${HIST_STAMPS-} in
  "mm/dd/yyyy") alias history='omz_history -f' ;;
  "dd.mm.yyyy") alias history='omz_history -E' ;;
  "yyyy-mm-dd") alias history='omz_history -i' ;;
  "") alias history='omz_history' ;;
  *) alias history="omz_history -t '$HIST_STAMPS'" ;;
esac

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
# }}
# Plugins {{ 
zinit light "zsh-users/zsh-autosuggestions"
#zinit light "zsh-users/zsh-completions"
#zinit light "clarketm/zsh-completions"
#zinit light "molovo/crash"
zinit light "mafredri/zsh-async"
zinit light "zdharma-continuum/fast-syntax-highlighting"
zinit ice depth=1; zinit light romkatv/powerlevel10k
# }}
# Config of Plugins {{
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# }}
# Aliases {{
alias ls='exa --icons --long'
alias icat='kitty +kitten icat'
alias l='ls'
alias gstat='git diff --stat'
alias vim='nvim'
alias cat='bat -p --theme=ansi'
_TH=$(command -v thefuck)
[[ -z $_TH ]] && export _TH=":"
eval $($_TH --alias)
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh
# }}
# Prompt {{
# _git_info() {
# GIT_INFO=''
# if [[ -d .git ]]; then  
#    GIT_INFO='git:'
#    GIT_INFO+=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
# fi
# echo $GIT_INFO
# }
# setopt prompt_subst
# export __NL=$'\n'
# PROMPT='[ %T %B%~%b ] ${__NL}$ '
# RPROMPT='$(_git_info)'
# }}
# Completion {{
autoload -U compinit     && compinit
autoload -U bashcompinit && bashcompinit
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';
zstyle :compinstall filename "$HOME/.config/zsh/conf.zsh"
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
# }} 
# Misc {{
. $HOME/.asdf/asdf.sh
export PATH="$(yarn global bin):$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"
# }}
# vim: foldmarker={{,}}
# vim: foldmethod=marker

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
