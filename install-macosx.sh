#! /bin/bash
# Installing Mac specific updates.

function brew_install() {
    if brew list "${@: -1}" >& /dev/null ; then
        printf "%-20s is already installed, skipping...\n" "${@: -1}"
    else
        brew install "$@"
    fi
}

echo "Installing homebrew for Mac package management."
if which brew >& /dev/null ; then
    echo "    Homebrew is already installed."
else
    echo "    Installing homebrew."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install the XCode command line tools, including Git.
xcode-select --install

# Set Capslock to function as the Escape key. This makes the expected changes,
# (which can be viewed with defaults -currentHost read -g), but the change
# doesn't take effect. Log back out and in for the change to take effect. The
# magic number seems to be vendor/product id, can retrieve with `ioreg -n
# IOHIDKeyboard -r`.
# https://apple.stackexchange.com/questions/4813/changing-modifier-keys-from-the-command-line
defaults -currentHost write -g com.apple.keyboard.modifiermapping.1452-627-0 '({
  HIDKeyboardModifierMappingDst = 30064771113;
  HIDKeyboardModifierMappingSrc = 30064771129;
})'

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

brew_install ag
brew_install jq
#brew install google-chrome
brew_install iterm2
brew_install --HEAD luajit
brew_install --HEAD neovim
brew_install coreutils

brew_install openjdk
brew_install jenv
path=($HOME/.jenv/bin $path)
eval "$(jenv init -)"
ls -d /Library/Java/JavaVirtualMachines/jdk*/Contents/Home/. \
    | sed 's|/\./||' | xargs -n 1 jenv add
jenv global 1.15

# Python is used by many things, and sometimes older and newer versions must
# coexist. See a list of available versions with pyenv install --versions
brew_install pyenv
brew_install pyenv-virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install 2.7.18
pyenv shell 2.7.18
pip install --upgrade pip
pyenv install 3.9.1
pyenv shell 3.9.1
pip install --upgrade pip
pyenv global 3.9.1
pyenv virtualenv 2.7.18 global-2.7
pyenv virtualenv 3.9.1 global-3.9

# Follow in the instructions at https://neovim.io/doc/user/provider.html
pyenv virtualenv 2.7.18 neovim-2.7
pyenv activate neovim-2.7
pip install --upgrade pip
pip install pynvim

pyenv virtualenv 3.9.1 neovim-3.9
pyenv activate neovim-3.9
pip install --upgrade pip
pip install pynvim

# Install Go lang.
export GOPATH=~/golang
mkdir $GOPATH
mkdir -p $GOPATH/src/github.com/jacobsimpson

export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

brew_install go
# Mercurial is used by the Go get command for installing some packages. Not sure if mercurial is
# used by 'go install'.
brew_install mercurial

go install golang.org/x/tools/cmd/godoc
go install golang.org/x/tools/cmd/vet

# Install Rust.
brew_install rust
brew_install luajit

brew_install exa
brew_install lua-language-server

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Agree to the Mac OS X XCode License.
sudo xcodebuild -license
