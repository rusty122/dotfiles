# ~/.bashrc
#
# Author: Russell Parker


# --------------------
# prompt
# --------------------
PROMPT_DIRTRIM=2
export PROMPT_COMMAND=prompt
prompt() {
    local exit=$?
    local maxmanwidth=80

    # append to central history file
    history -a

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


# --------------------
# general
# --------------------
export PAGER=less

# check the window size after each command and update dimensions
shopt -s checkwinsize

# use vim as default program for editing
export EDITOR=vim
export VISUAL=vim

# close shell on first Ctrl-D
set +o ignoreeof

# enable incremental search
stty -ixon


# --------------------
# movement
# --------------------
shopt -s autocd
shopt -s direxpand

# correct minor directory mis-spellings
shopt -s cdspell
shopt -s dirspell


# --------------------
# history
# --------------------
HISTCONTROL=ignoreboth
HISTSIZE="NO_LIMIT"
HISTFILESIZE="NO_LIMIT"
HISTTIMEFORMAT="%a %D %I:%M%P "


# --------------------
# completion
# --------------------
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  elif [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
  fi
fi


# --------------------
# colors
# --------------------
export CLICOLOR=1
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if tty -s; then
    export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
    export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
    export LESS_TERMCAP_me=$(tput sgr0)
    export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
    export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
    export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
    export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
    export LESS_TERMCAP_mr=$(tput rev)
    export LESS_TERMCAP_mh=$(tput dim)
fi


# --------------------
# man
# --------------------
export MANPAGER='less -JQ ++Gg'
export MANROFFOPT='-c' # equivalent to setting GROFF_NO_SGR
export MANLESS='\ Manual\ page\ \$MAN_PN\ %lt/%L %pB\%'


# --------------------
# ssh and gpg
# --------------------
unset SSH_AGENT_PID
export GPG_TTY=$(tty)
alias gpg=gpg2
gpg-connect-agent updatestartuptty /bye >/dev/null
