# ~/.bashrc
#
# Author: Russell Parker

export PROMPT_COMMAND=prompt
prompt() {
    local exit=$?
    PS1="\[\e[32m\]\u \[\e[37m\]\w \[\e[31m\]\$\[\e[0m\] "
    if [ $exit -ne 0 ]; then
        echo "Exit code: $exit"
    fi
}

# history
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000
shopt -s histappend # append history file

# check the window size after each command and update dimensions
shopt -s checkwinsize

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# get color vars for files and directories
eval "$(dircolors -b)"

# use colors in commands
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# configure GCC colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# configure less to use colors
export LESS_TERMCAP_mb=$(printf '\e[01;31m')
export LESS_TERMCAP_md=$(printf '\e[01;35m')
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')    
export LESS_TERMCAP_so=$(printf '\e[01;33m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_us=$(printf '\e[04;36m')
