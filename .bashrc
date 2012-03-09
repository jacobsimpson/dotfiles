# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias behub='sudo -u hub -s -H'
datahub_home=${HOME}/projects/trunk

alias ls='ls --color=tty -F'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fmtdate='python -c "import sys; from datetime import datetime; print datetime.strftime(datetime.strptime(sys.stdin.read().strip(), sys.argv[1]), sys.argv[2])"'

export HISTFILESIZE=10000
export HISTTIMEFORMAT="%b %d, %Y %T "

shopt -s histappend

export PATH=${PATH}:/sbin:/usr/sbin

export PATH=/usr/local/bin/vim-7.3/bin/:${PATH}
# DataHub python version.
export PATH=/hub/apps:${PATH}

export PATH=${HOME}/workspace/src/go/bin:${PATH}

export PATH=/hub/apps/PythonHome/bin/:${PATH}
export PATH=${HOME}/bin:${PATH}

# Sun instant messaging queue commands.
export PATH=${PATH}:/opt/imq/bin


export JAVA_HOME=/usr/local/bin/jdk1.6.0_23/
export JAVA_HOME=/usr/local/java/jdk
export PATH=${JAVA_HOME}/bin:${PATH}

export GOROOT=${HOME}/workspace/src/go
export PATH=${PATH}:${GOROOT}/bin

export GROOVY_HOME=/usr/local/bin/groovy-1.7.7/
export PATH=${PATH}:${GROOVY_HOME}/bin

export GRAILS_HOME=/usr/local/bin/grails-1.3.6/
export PATH=${PATH}:${GRAILS_HOME}/bin

export SCALA_HOME=/usr/local/bin/scala-2.8.1.final/
export PATH=${PATH}:${SCALA_HOME}/bin

export PATH=${PATH}:/usr/local/bin/quilt-0.47/bin/

export PATH=${PATH}:/usr/local/bin/checkstyle-5.3/

export PATH=${PATH}:/usr/local/bin/jakarta-jmeter-2.4/bin/

alias rdesktop='rdesktop -g1024x768'

DH_SOURCE=${HOME}/projects/cfengine/resources/public/scripts/hub-developer/dh.sh
if [ ! -e $DH_SOURCE ]; then
  DH_SOURCE=/hub/scripts/hub-developer/dh.sh
fi
test -e $DH_SOURCE && source $DH_SOURCE

test -e ~/ssh_agent.txt && source ~/ssh_agent.txt

export PYTHONSTARTUP=${HOME}/bin/pyprompt.py 

# Emacs includes a ctags version that breaks Maketags in vim.
#export PATH=/usr/local/bin/emacs-23.2/bin/:${PATH}
#alias emacs='emacs -g 175x70+0+20'

export JYTHON_HOME=/usr/local/bin/jython-2.5.2
export PATH=${JYTHON_HOME}/bin:${PATH}

export SVN_EDITOR=emacsclient

export EMACS_HOME=/usr/local/bin/emacs-23.4
export PATH=${EMACS_HOME}/bin:${PATH}

alias vi="emacsclient -n"
alias emacs="emacs -g 155x70+0+20"