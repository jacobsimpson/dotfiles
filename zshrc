# These are the special settings for my personal
# zsh environment. This file is intended to be
# sourced from inside the ~/.zshrc.
# Add this line to ~/.zshrc:
#
# test -f ~/dotfiles/zshrc && source ~/dotfiles/zshrc
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

alias grep='egrep --color=auto'
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

export PYTHONSTARTUP=${HOME}/dotfiles/python/pyprompt.py

# function rg() {
#     find . -name "$2" -exec egrep --color=auto -H "$1" {} \;
# }

path=("${HOME}/bin" $path)
path=("${HOME}/.local/bin" $path)

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

#export PATH=$PATH:$HOME/.pyenv/bin/
if which pyenv &> /dev/null; then
    # pyenv shell switches between different Python interpreters, and it hacks up
    # my prompt to show me which one is active, but I would rather it didn't do
    # that.
    export VIRTUAL_ENV_DISABLE_PROMPT="DoIt"

    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)" >& /dev/null
    pyenv shell 3.9.1
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
#source ~/dotfiles/extended-history.plugin.zsh

# Make the terminal stop beeping, ever.
unsetopt beep
unsetopt histbeep
unsetopt listbeep

if which jenv >& /dev/null ; then
  path=($HOME/.jenv/bin $path)
  eval "$(jenv init -)"
fi

alias cd.='cd $(pwd)'

if [[ -e ${HOME}/.local/bin/nvim ]]; then
    alias vi=${HOME}/.local/bin/nvim
    alias vim=${HOME}/.local/bin/nvim
elif [[ -e ${HOME}/bin/nvim ]]; then
    alias vi=${HOME}/bin/nvim
    alias vim=${HOME}/bin/nvim
elif [[ -e /usr/bin/nvim ]]; then
    alias vi=/usr/bin/nvim
    alias vim=/usr/bin/nvim
fi

# function vi() {
#     if [[ ! -z "$NVIM_LISTEN_ADDRESS" ]]; then
#         nvim --server $NVIM_LISTEN_ADDRESS --remote-send '<ESC><C-W><C-K>'
#         nvim --server $NVIM_LISTEN_ADDRESS --remote "$@"
#     elif [[ ! -z "$ITERM_SESSION_ID" ]]; then
#         id=$(echo "$ITERM_SESSION_ID" | sed 's|^\(....\).*|\1|')
#         socket=/tmp/nvim.$id
#         if [[ -e $socket ]]; then
#             nvim --server $socket --remote "$@"
#         else
#             nvim --listen $socket "$@"
#         fi
#     else
#         nvim "$@"
#     fi
# }

alias mkdir='mkdir -p'

# A much improved version of ls.
if which exa >& /dev/null; then
    alias ls='exa --icons -F'
fi

export PATH=$PATH:${HOME}/.cargo/bin

export CDPATH=$CDPATH:$HOME/src

[ -f ~/.resh/shellrc ] && source ~/.resh/shellrc # this line was added by RESH (Rich Enchanced Shell History)

#
# zsh has two completion systems. The old system, compctl, and the new system, compsys.
#
# compsys is a collection of zsh functions with three critical components:
# 1. Base - core and basic completer functions
# 2. Zsh - code for zsh built in commands, like `cd`
# 3. Unix - code for completing external commands.
#
autoload -U compinit ; compinit

#
# :completion:<function>:<completer>:<command>:<argument>:<tag>
#
# argument - apply the style to the nth argument.
# tag - apply the style to a specific type of argument, "files", "domains", "users", "options"
#

# Interesting thing, aliases will still receive the benefit of this completion guidance, though I
# did get a hint that it is configurable whether that is true or not.
zstyle ':completion:*:*:nvim:*' file-patterns '^*.(lock|pdf):source-files' '*:all-files'

eval "$(zoxide init zsh)"
alias cd='echo "Try \"z\" instead."'

alias du='echo "Try \"dust\" instead."'

#
# Use the vi key mappings when working at the command line.
#
bindkey -v

# Yank to the system clipboard
function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | xclip -i
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip




function command_not_found_handler() {
    if [[ $0 =~ "^https://" ]]; then
        xdg-open "$0"
    fi

    echo "You fell victim to one of the classic blunders: $0"
    return 1
}

# Remap the Capslock key to be Esc.
setxkbmap -option caps:escape

# When the AWS CLI is available, this is an improved pager experience.
export AWS_PAGER='bat -l json --style plain'

# It would be nice to set this in the psqlrc file, just to keep related settings
# together. However, whenever I use \set to set this value, it gets ignored.
export PSQL_EDITOR=/home/jacobsimpson/.local/bin/nvim

autoload -U add-zsh-hook

record_cwd() {
	pwd > ~/.local/state/cwd
}

add-zsh-hook chpwd record_cwd

[[ -e ~/.local/state/cwd ]] && \cd `cat ~/.local/state/cwd`
