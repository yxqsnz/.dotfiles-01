_git_info() {
GIT_INFO=''
if [[ -d .git ]]; then  
   GIT_INFO='git:'
   GIT_INFO+=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
fi
echo $GIT_INFO
}
setopt prompt_subst
export __NL=$'\n'
PROMPT='[ %T %B%~%b ] ${__NL}$ '
RPROMPT='$(_git_info)'
