# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# disable job control (bg, fg, ctrl-z)
set +m

stty -ixon

export PATH=~/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/opt:$PATH
export PATH=~/.cargo/bin:$PATH

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

[ -f ~/.bash_auxiliary ] && source ~/.bash_auxiliary
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_docker ] && source ~/.bash_docker
[ -f ~/.bash_go ] && source ~/.bash_go
[ -f ~/.bash_python ] && source ~/.bash_python
[ -f ~/.bash_functions ] && source ~/.bash_functions
[ -f ~/.bash_proxy ] && source ~/.bash_proxy

[ -f ~/.bash_private ] && source ~/.bash_private

# fedora-specific path for git prompt
[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ] && source /usr/share/git-core/contrib/completion/git-prompt.sh

# pull rust cargo env
. "$HOME/.cargo/env"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

HISTIGNORE='ls:la:history:pwd:clear:rm *:git commit --amend'

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=2000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ -n "$DISPLAY" ]; then
    xset b off
fi

case "$TERM" in
    xterm*) TERM=xterm-256color
esac

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

PROMPT_DIRTRIM=1
GIT_PS1_SHOWDIRTYSTATE=1

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}'
    PS1+='\[\033[00m\]'  # reset
    PS1+='\[\033[01;34m\]\w'  # location
    PS1+='\[\033[00m\]'  # reset
    PS1+='\[\033[38;5;250m\]$(__git_ps1)'
    PS1+='\[\e[0;$(($?==0?32:31))m\]>'  # green '>' if last cmd succeed, else red
    PS1+='\[\033[00m\] '  # end
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac
