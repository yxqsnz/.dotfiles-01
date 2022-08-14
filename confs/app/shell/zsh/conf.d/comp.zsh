autoload -U compinit

# Completer options
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate

# Completion file name

zstyle :compinstall filename "${HOME}/.zshrc"

# Menu
zstyle ':completion:*' menu select yes

# Colors uwu
 zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")'

# ASDF
fpath=(${ASDF_DIR}/completions $fpath)
compinit

# Lazy completions
znap function _pyenv pyenv              'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

znap function _pip_completion pip       'eval "$( pip completion --zsh )"'
compctl -K    _pip_completion pip

znap function _python_argcomplete pipx  'eval "$( register-python-argcomplete pipx  )"'
complete -o nospace -o default -o bashdefault \
           -F _python_argcomplete pipx

znap function _pipenv pipenv            'eval "$( pipenv --completion )"'
compdef       _pipenv pipenv
