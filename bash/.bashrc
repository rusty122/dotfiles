# ~/.bashrc
#
# Author: Russell Parker

export PROMPT_COMMAND=prompt
prompt() {
    local exit=$?
    local maxmanwidth=80
    # set primary prompt string and print non-zero exit codes
    PS1="\[\e[32m\]\u \[\e[37m\]\w \[\e[31m\]\$\[\e[0m\] "
    if [ $exit -ne 0 ]; then
        echo "Exit code: $exit"
    fi

    # set line width for man pages with maximum of 80
    if [ $COLUMNS -lt $maxmanwidth ]; then
        export MANWIDTH=$COLUMNS
    else
        export MANWIDTH=$maxmanwidth
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
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# configure GCC colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# configure less termcap colors
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)

# configure man less prompt and groff color
export MANLESS='\ Manual\ page\ \$MAN_PN\ %lt/%L %pB\%'
export MANPAGER='less ++Gg'
export MANROFFOPT='-c' # equivalent to setting GROFF_NO_SGR

# use vim as default program for editing
export EDITOR=vim
export VISUAL=vim

# close shell on first ^D
export IGNOREEOF=0
