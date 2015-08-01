# These are the special settings for my personal
# zsh environment. This file is intended to be
# sourced from inside the ~/.zshrc.
# Add this line to ~/.zshrc:
#
# test -f ~/home-dir/zshrc && source ~/home-dir/zshrc
#

# Disables sharing history between active terminals.
unsetopt share_history
unsetopt autopushd

alias ls='ls -FG'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fmtdate='python -c "import sys; from datetime import datetime; print datetime.strftime(datetime.strptime(sys.stdin.read().strip(), sys.argv[1]), sys.argv[2])"'

setopt COMPLETE_IN_WORD
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt EXTENDED_HISTORY
HISTFILE=~/.zsh_history
SAVEHIST=100000
HISTSIZE=100000


export PATH=${PATH}:/sbin:/usr/sbin

export PYTHONSTARTUP=${HOME}/home-dir/python/pyprompt.py 

function rg() {
    find . -name "$2" -exec egrep --color=auto -H "$1" {} \;
}

export PATH=/Users/jsimpson/bin:${PATH}

# An alias that will open any specified html file in the currently running
# # Chrome browser, or start an instance.
alias chrome='/usr/bin/open -a "/Applications/Google Chrome.app"'

