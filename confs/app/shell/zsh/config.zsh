export ZNAP_HOME=${HOME}/.local/share/zsh-snakes

[[ -f ${ZNAP_HOME}/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ${ZNAP_HOME}

source ${ZNAP_HOME}/znap.zsh

# Options
setopt interactive_comments hist_ignore_dups  octal_zeroes   no_prompt_cr
setopt no_hist_no_functions no_always_to_end  append_history list_packed
setopt inc_append_history   auto_pushd
setopt pushd_ignore_dups    no_glob_complete  no_glob_dots   c_bases
setopt numeric_glob_sort    no_share_history  promptsubst    auto_cd
setopt rc_quotes            extendedglob      notify


# History
export Z_CACHE=${HOME}/.cache/zsh
export HISTTIMEFORMAT="[%F %T] "

if ! [[ -d "${Z_CACHE}" ]]; then
    mkdir -p ${Z_CACHE}
fi

export HISTFILE=${Z_CACHE}/.ZHistory
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000

znap eval starship 'starship init zsh --print-full-init'
# starship_precmd
znap prompt 
