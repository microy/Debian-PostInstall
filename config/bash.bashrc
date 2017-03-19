# System-wide .bashrc file for interactive bash(1) shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Don't put duplicate lines in the history.
# Force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# History length
HISTSIZE=1000
HISTFILESIZE=2000

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Fancy prompt
if [ "`id -u`" -eq 0 ]; then
  # Root account prompt (red)
  PS1='\[\e[31m\]\u\[\e[m\]@\[\e[35m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\$ '
else
  # User account prompt (green)
  PS1='\[\e[32m\]\u\[\e[m\]@\[\e[35m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\$ '
fi

# Enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Do not bell on tab-completion
bind "set bell-style none"

# Aliases
alias ls='ls -h --color=auto --group-directories-first'
alias ll='ls -lv'
alias la='ll -A'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias tree='tree -C --dirsfirst'
alias ssh-nokey='ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null'
