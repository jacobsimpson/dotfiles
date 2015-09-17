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

if uname -a | grep Darwin >& /dev/null ; then
    alias ls='ls -FG'
else
    alias ls='ls -F --color=auto'
fi

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

export PATH=${HOME}/bin:${PATH}

# An alias that will open any specified html file in the currently running
# # Chrome browser, or start an instance.
alias chrome='/usr/bin/open -a "/Applications/Google Chrome.app"'

if which nvim >& /dev/null ; then
    alias vi=${HOME}/home-dir/bin/nvim-wrapper
    alias vim=${HOME}/home-dir/bin/nvim-wrapper
    alias nvim=${HOME}/home-dir/bin/nvim-wrapper
fi

# Golang configuration.
gopath=~/golang

export GOPATH=$gopath
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

alias vbm=vboxmanage

alias history='fc -iln 0'

# Disables zsh from doing the history expansion and waiting for confirmation
# before continuing, like this:
# ➜  2015-09-02-WordSearch  mkdir src
# ➜  2015-09-02-WordSearch  ls !$
# ➜  2015-09-02-WordSearch  ls src
unsetopt HIST_VERIFY

if which pyenv &> /dev/null; then
    # pyenv shell switches between different Python interpreters, and it hacks up
    # my prompt to show me which one is active, but I would rather it didn't do
    # that.
    export VIRTUAL_ENV_DISABLE_PROMPT="DoIt"

    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)" >& /dev/null
    pyenv shell global-3.4
fi
