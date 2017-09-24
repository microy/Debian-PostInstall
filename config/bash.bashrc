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

# Highlight the user name when logged in as root.
if [ "${USER}" = "root" ]; then
	user_style="\e[31m";
else
	user_style="\e[32m";
fi;

# Highlight the hostname when connected via SSH.
if [ -n "${SSH_TTY}" ]; then
	host_style="\e[31m";
else
	host_style="\e[33m";
fi;

# Fancy prompt
PS1="\[${user_style}\]\u";  # User
PS1+="\[\e[m\]@";           # @
PS1+="\[${host_style}\]\h"; # Host
PS1+="\[\e[m\]:";           # :
PS1+="\[\e[36m\]\w";        # Working directory
PS1+="\[\e[m\]\\$ ";        # $


# Enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
