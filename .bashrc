alias ..='cd ..'
alias l='ls -1trF --color=auto'
alias e='exit'
alias cl='clear'
alias vim='vim -p'
alias gg='git log -S'
alias gs='git status'
alias gd='git diff'
alias gl='git lg'
alias gls='git lg -n8'
alias ga='git add'


function gc(){
    git commit -m "$*"
}

function cd(){
    builtin cd "$@" && l
}

PS1="\n\n\[\e[32m\][\u@\h \w]\\$\[\e[0m\] "
