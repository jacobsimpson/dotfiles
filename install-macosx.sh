#! /bin/bash
# Installing Mac specific updates.

echo "Installing homebrew for Mac package management."
if which brew >& /dev/null ; then
    echo "    Homebrew is already installed."
else
    echo "    Installing homebrew."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install the XCode command line tools, including Git.
xcode-select --install

# Set the defaults so all files are visible in Finder.
defaults write com.apple.finder AppleShowAllFiles YES
# Set the initial delay after a key is held down until it repeats.
defaults write -g InitialKeyRepeat -int 25
# Make the key repeat quickly when a key is held down.
defaults write NSGlobalDomain KeyRepeat -int 1
# http://apple.stackexchange.com/questions/58769/my-keyboard-stopped-repeating-how-to-fix
# Might require a restart to take effect.
# Setting this true brings up the alternate input menu for certain keys.
defaults write -g ApplePressAndHoldEnabled -bool false

brew install ag
brew install jq
brew install google-chrome
brew install karabiner # To remap Pause to Eject for locking the screen.
brew install iterm2
brew install seil
brew install xquartz
brew install --HEAD luajit
brew install --HEAD neovim
brew install coreutils

brew install openjdk
brew install jenv
path=($HOME/.jenv/bin $path)
eval "$(jenv init -)"
ls -d /Library/Java/JavaVirtualMachines/jdk*/Contents/Home/. \
    | sed 's|/\./||' | xargs -n 1 jenv add
jenv global 1.15

# Python is used by many things, and sometimes older and newer versions must
# coexist.
brew install pyenv
brew install pyenv-virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install 2.7.18
pyenv install 3.9.2
pyenv global 3.9.2
pyenv virtualenv 2.7.18 neovim-2.7
pyenv virtualenv 3.9.2 neovim-3.9
pyenv virtualenv 2.7.18 global-2.7
pyenv virtualenv 3.9.2 global-3.9
pip install --upgrade pip
pip install virtualenv

# Install Go lang.
export GOPATH=~/golang
mkdir $GOPATH
mkdir -p $GOPATH/src/github.com/jacobsimpson

export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

brew install go
# Mercurial is used by the Go get command for installing some packages.
brew install mercurial

go get golang.org/x/tools/cmd/godoc
go get golang.org/x/tools/cmd/vet

# Install Rust.
brew install rust
brew install luajit

# Agree to the Mac OS X XCode License.
sudo xcodebuild -license
