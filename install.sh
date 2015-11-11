#! /bin/bash

echo

echo "Set the shell to zshrc."
chsh -s /bin/zsh

echo "Installing NeoBundle for vim."
if [[ -d ~/.vim/bundle/neobundle ]] ; then
    echo "    Already installed."
else
    pushd ~
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
    sh ./install.sh
    popd
fi

echo "Installing vim settings."
if grep "source .*home-dir.vim.vimrc" ~/.vimrc >& /dev/null ; then
    echo "    vim settings already installed. Skipping."
else
    echo 'source ~/home-dir/vim/vimrc' >> ~/.vimrc
fi
ln -nsf ~/home-dir/vim/bundle/NeoBundle.lock ~/.vim/bundle/NeoBundle.lock

mkdir -p ~/.config/nvim
ln -s ~/.vim ~/.nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
# This is the directory where backup files are written. For some reason Neovim
# doesn't create this itself. Or, it didn't at 10/29/2015.
mkdir ~/.local/share/nvim/backup

echo "Installing the Git configuration."
if grep "home-dir.gitconfig" ~/.gitconfig >& /dev/null ; then
    echo "    The Git config settings are already installed. Skipping."
else
    echo '[include]
    path = ~/home-dir/gitconfig
' >> ~/.gitconfig
fi

echo "Installng Oh My Zsh"
if [[ -d ${HOME}/.oh-my-zsh ]]; then
    echo "    Oh My Zsh already installed. Skipping."
else
    pushd ${HOME}
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    popd
fi

echo "Installing zshrc settings."
if grep "source .*home-dir.zshrc" ~/.zshrc >& /dev/null ; then
    echo "    zshrc settings already installed. Skipping."
else
    echo 'test -f ~/home-dir/zshrc && source ~/home-dir/zshrc' >> ~/.zshrc
fi

if uname -a | grep Darwin >& /dev/null ; then
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
    defaults write -g InitialKeyRepeat -int 20
    # Make the key repeat quickly when a key is held down.
    defaults write NSGlobalDomain KeyRepeat -int 1

    brew install ag
    brew install jq
    brew install caskroom/cask/brew-cask
    brew cask install google-chrome
    brew cask install spectacle # To remap Capslock to Esc.
    brew cask install karabiner # To remap Pause to Eject for locking the screen.
    brew cask install java
    brew cask install iterm2
    brew cask install atom
    brew cask install intellij-idea
    brew cask install seil
    brew cask install xquartz
    brew cask install dia
    brew tap neovim/neovim
    brew install --HEAD neovim
    brew install pyenv
    brew install pyenv-virtualenv
    brew install coreutils

    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    pyenv install 2.7.10
    pyenv install 3.4.3
    pyenv global 3.4.3
    pyenv virtualenv 2.7.10 neovim-2.7
    pyenv virtualenv 3.4.3 neovim-3.4
    pyenv virtualenv 2.7.10 global-2.7
    pyenv virtualenv 3.4.3 global-3.4

    # Install Go lang.
    gopath=~/golang
    mkdir $gopath
    mkdir -p $gopath/src/github.com/jacobsimpson

    export GOPATH=$gopath
    export GOROOT=/usr/local/opt/go/libexec
    export PATH=$PATH:$GOPATH/bin
    export PATH=$PATH:$GOROOT/bin

    brew install go
    # Mercurial is used by the Go get command for installing some packages.
    brew install mercurial

    go get golang.org/x/tools/cmd/godoc
    go get golang.org/x/tools/cmd/vet
    go get github.com/constabulary/gb/...
fi

pip install --upgrade pip
pip install virtualenv

# Agree to the Mac OS X XCode License.
sudo xcodebuild -license

echo

