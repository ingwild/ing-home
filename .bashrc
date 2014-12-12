#!/bin/bash
#
# ing's bash profile
# for Debian 7
# version 1.0
#

# global

# prompt
PS1A='\[\012\[\e[0m\]['
PS1B='\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]]'
if [ "`id -u`" = '0' ]; then
  PS1="$PS1A\[\e[1;31m\]$PS1B# "
else
  PS1="$PS1A\[\e[0;32m\]$PS1B$ "
fi
export PS1

# variables

export EDITOR='vim'
export HISTFILE=
export PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games'
export VISUAL='vim'

[ $TERM != 'linux' ] && export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}\007"'

# functions

psg() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
lh() { ls -ltA --color=always "$@" | head -n20; }
f() { find . -iname "*$@*"; }

# aliases

if [ "$TERM" != "dumb" ]; then
    alias ls='ls --color=auto -A'
    alias grep='grep --color=auto';
    alias egrep='egrep --color=auto';
    alias fgrep='fgrep --color=auto';
fi

alias a='aptitude'
alias bc='bc -lq'
alias cal='ncal -M'
alias df='df -hT -x rootfs -x tmpfs -x devtmpfs'
alias du='du -sh'
alias h='history | grep 2>/dev/null'
alias i='ifstat'
alias j='jobs'
alias l='ls -l'
alias lt='ls -lt --color=always'
alias log="tail -n0 -f /var/log/{{auth,mail}.log,syslog} | grcat conf.log"
alias ps='ps axfo user,pid,vsz,rss,%cpu,stat,start_time,args | egrep -v "(\[kthreadd\]|\\_ \[.+\])" | grep -v grep'
alias r='echo -ne \\ec'
alias s='sudo su -'
alias sum="xargs | tr ' ' '+' | bc -l"
alias stow='stow -v'
alias u='uptime'
alias v='vmstat 1'
alias x='exit'
alias z='find . -type f \( -name \*.Z -or -name \*.gz -or -name \*.tgz \) -exec gzip -v --test {} \;; find . -type f -name \*.bz2 -exec bzip2 -v --test {} \;; find . -type f -name \*.zip -exec zip -T {} \;; find . -type f -name \*.xz -exec xz -tv {} \;'

# local

# 256 colors
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

