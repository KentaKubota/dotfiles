# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth


# append to the history file, don't overwrite it
shopt -s histappend


# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=2000


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac


# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


alias e='exit'
alias vim='vim -p'
alias cgrep='grep -n --color=always'
alias cl='clear'
alias diff='colordiff -u'
alias cd..='cd ..'
alias ..='cd ..'
alias less='less -R'
alias top='top -a'
alias Date_mkdir='date +%y%m%d | xargs mkdir'
#alias cb='catkin build'
alias cb='cd ~/catkin_ws/src/ && catkin build && cd -'
#alias Backup_ubuntu='cd ~/.. && rsync -arpv --delete kenta/ /media/kenta/Transcend/BackUp/ubuntu/ && cd -'
alias Backup_mac='cd ~/.. && rsync -arpv --delete kenta/ /media/kenta/Transcend/BackUp/ubuntu/ && cd -'
alias cw='cd /home/kenta/catkin_ws/src/'
alias C='./a.out'
alias Latex_pdf_out='~/.latex_pdf_out.sh'
#alias Run_program='~/.run_program.sh'
alias Note='cd ~/Dropbox/Documents/ && vim -p Memo.txt DoneList.txt Application.txt English.txt Panasonic.txt'
#alias Note='cd ~/Documents/ && vim -p Memo DoneList Application English panasonic/panasonic'
#alias Note='cd ~/Dropbox/Documents/ && vim -p Memo.txt DoneList.txt Research.txt English.txt panasonic/panasonic.txt'
alias Open_filer='xdg-open .' # open filer in current directory
alias Graph='eog "$a" & &> /dev/null'
alias Xmodmap='xmodmap ~/.Xmodmap'
alias Webdav='sudo mount -t davfs -o uid=$UID,gid=$(id -g) http://www.hayashibara-lab.it-chiba.ac.jp/member/ ~/webdav/'
alias Webdav_out='sudo umount ~/webdav/'
alias t='yes | tw'
alias Shutdown_pc='sudo shutdown -h now'
alias Suspend_pc='dbus-send --system --print-reply=literal --dest=org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager.Suspend boolean:true'
alias Reboot='sudo reboot'
    # mac alias
#export LSCOLORS=EaFxcxdxCxegedabagacad

alias cgrep='grep -n --color=always'
alias efind='find -E ./'
alias o='open .'

#-----------------------------
alias updateBashrc='source ~/.bashrc'
#-----------------------------
# git
alias gg='git log -S'
alias gs='git status'
alias gd='git diff'
alias gl='git lg'
alias ga='git add'
alias Git_save='git commit -am "save"'




# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#*********************************************************
function cd(){
     builtin cd "$@" && l
}

#*********************************************************
#function l(){
#    command ls -lLtrhFG | awk '{printf "%s %2s %5s %s \n",$6,$7,$8,$9}' 
#}

function l(){
    ls -1tr --color=always
}


#*********************************************************
function gca(){
    git commit -am "$*"
}

#*********************************************************
function gc(){
    git commit -m "$*"
}


#*********************************************************
function Make_latex_pdf(){
ls -1 | grep png$ | awk -F. '{print $1}' | while read f ; do convert ${f}.png ${f}.pdf; extractbb ${f}.pdf; done
}

#*********************************************************
function Calc_date(){ 
    expr \( `date -j -f "%Y%m%d" "$2" "+%s"` - `date -j -f "%Y%m%d" "$1" "+%s"` \) \/ 86400
}
#*********************************************************
function Run_program(){ 

if [ "$#" -eq 0 ]; then
    echo "ERROR:    When run a program,input the cppfile."
    echo "Example:  $ Run_program test.cpp"
    exit 1
fi

g++ "$1" "$2" "$3" "$4" "$5" "$6"

if [ "$?" -eq 1 ]; then
echo  "\n----------  Build Failed  ----------\n"
    exit 1
fi

echo  "\n----------  Build Succeeded  ----------\n"
./a.out

}

#*********************************************************
# share history each terminal 

# export PROMPT_COMMAND='history -a; history -r'

#*********************************************************
# Powerline setting
function _update_ps1(){
    export PS1="\n\n$(~/powerline-shell.py $? 2> /dev/null)\n\[\e[1;34m\]`LC_ALL=C date | awk '{printf "%s %s.%s %s",$1,$2,$3,$4}' | sed "s/...$//g"`\[\e[0m\] \[\e[0;32m\]$\[\e[0m\] "
}
export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"


source ~/.git-completion.bash

# command + space で端末を起動する際　session restored tteって出るのでclで対策 
cl

#default editor is vim
export EDITOR=/usr/bin/vim

