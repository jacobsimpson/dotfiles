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

# Put the more current versions of the GNU utils from coreutils at the front of
# the path.
path=("/usr/local/opt/coreutils/libexec/gnubin" $path)

if uname -a | grep Darwin >& /dev/null && ! ls --version >& /dev/null; then
    # These are the flags for color and file type characters if we are on a
    # Mac, and not using the GNU version of 'ls'
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


path+=('/sbin' '/usr/sbin')

export PYTHONSTARTUP=${HOME}/home-dir/python/pyprompt.py

function rg() {
    find . -name "$2" -exec egrep --color=auto -H "$1" {} \;
}

path=("${HOME}/bin" $path)

# An alias that will open any specified html file in the currently running
# # Chrome browser, or start an instance.
alias chrome='/usr/bin/open -a "/Applications/Google Chrome.app"'

# Golang configuration.
gopath=~/golang

export GOPATH=$gopath
export GOROOT=/usr/local/opt/go/libexec
path+=("$GOPATH/bin" "$GOROOT/bin")

function vbm() {
  if [[ $1 == "ssh" || $1 == "ip" ]]; then
    if [[ -z $2 ]]; then
      echo "You must specify a VM to ssh to."
    else
      ip=$(vboxmanage guestproperty get "$2" /VirtualBox/GuestInfo/Net/0/V4/IP 2>&1)
      if [[ ! $? -eq 0 ]]; then
        echo "Could not get an IP address for '$2'. Try one of these:"
        echo
        vboxmanage list vms
      else
        ip=$(echo $ip | sed 's|Value: ||')
        if [[ $1 == "ssh" ]]; then
          ssh -o StrictHostKeyChecking=no $ip
        else
          echo $ip
        fi
      fi
    fi
  else
    vboxmanage "$@"
  fi
}

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
    pyenv shell 3.7.0
fi

function mcd() {
  mkdir -p "$1" && cd "$1"
}

function cd() {
  if [[ -z $1 ]]; then
    builtin cd
  elif [[ -f $1 ]]; then
    dirname=$(dirname "$1")
    builtin cd "$dirname"
  else
    builtin cd "$1"
  fi
}

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

alias g=git
alias gi=git

export PROMPT="$(echo $PROMPT | sed 's|^[^ ]* ||')"
export PROMPT="${PROMPT}
${ret_status}%{$fg_bold[green]%}%p %{$reset_color%}"

# Enable extended history.
source ~/home-dir/extended-history.plugin.zsh

# Make the terminal stop beeping, ever.
unsetopt beep
unsetopt histbeep
unsetopt listbeep

if which jenv >& /dev/null ; then
  path=($HOME/.jenv/bin $path)
  eval "$(jenv init -)"
fi

# Fix golang package stupidity.
 alias ff='find $GOPATH/pkg -type d -exec chmod a+wx {} \;'
