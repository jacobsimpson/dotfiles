# These are the special settings for my personal
# bash environment. This file is intended to be
# sourced from inside the ~/.bashrc.
# Add this line to ~/.bashrc:
#
# test -f ~/home-dir/.bashrc && source ~/home-dir.bashrc
#

alias ls='ls --color=tty -F'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fmtdate='python -c "import sys; from datetime import datetime; print datetime.strftime(datetime.strptime(sys.stdin.read().strip(), sys.argv[1]), sys.argv[2])"'

export HISTFILESIZE=10000
export HISTTIMEFORMAT="%b %d, %Y %T "

shopt -s histappend

export PATH=${PATH}:/sbin:/usr/sbin

alias rdesktop='rdesktop -g1024x768'

test -e ~/ssh_agent.txt && source ~/ssh_agent.txt >& /dev/null

export PYTHONSTARTUP=${HOME}/bin/pyprompt.py 

export SVN_EDITOR=emacsclient

# Emacs includes a ctags version that breaks Maketags in vim.
alias vi="emacsclient -n"
alias emacs="emacs -g 155x70+0+20"

function rg() {
    find . -name "$2" -exec egrep --color=auto -H "$1" {} \;
}

# Allows autocomplete of previously used ssh targets.
#complete -W "$(echo $(grep '^ssh ' ${HOME}/.bash_history | sort -u | sed 's/^ssh //'))" ssh
complete -W "$(echo $(sed 's|[, ].*||; s|.int.pason.com||' .ssh/known_hosts | sort -u))" ssh

