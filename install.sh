#! /bin/bash

function install() {
    if [[ $OS == "macos" ]]; then
        brew install "$1"
    else
        if dpkg -s "$1" >& /dev/null ; then
            printf "%-26s already installed, skipping...\n" "$1"
        else
            sudo apt install -y "$1"
        fi
    fi
}

function install_cargo() {
    if cargo install --list | grep $1 >& /dev/null ; then
        printf "Crate %-20s already installed, skipping...\n" "$1"
    else
        cargo install $1 $2 $3
    fi
}

function install_font() {
    font_name="$1"
    zip_file="$2"

    mkdir -p ~/.fonts
    if ls ~/.fonts | grep -i "^$font_name" >& /dev/null ; then
        printf "Font %-22s already installed, skipping...\n" "$1"
    else
        cd ~/Downloads
        if [[ ! -e $1.zip ]]; then
            curl -L -O https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/${zip_file}.zip
        fi
        echo "Moving to the .fonts directory."
        cd ~/.fonts
        unzip -o ~/Downloads/${zip_file}.zip
        echo "Updating the font cache"
        fc-cache -fv >& /dev/null
    fi
}

OS=macos
if uname | grep -i linux >& /dev/null ; then
    OS=linux
fi

# Where I like to put random little programming projects.
mkdir -p ~/src
# I saw someone user `~/.local/bin` once, which sounds like a great idea, but this is where I've
# been putting my extra binaries for a while now.
mkdir -p ~/bin

install curl
install zsh
install silversearcher-ag
install git
install jq
install fd-find
install openjdk-19-jdk
install golang
install mercurial
install luajit
install exa
install duf
install btop
install tig
install cmake
install xclip      # This package allows Neovim to integrate with the system clipboard.
install linux-tools-common
install linux-tools-generic
install linux-tools-`uname -r`
install zoxide

if which rustup >& /dev/null ; then
    printf "%-26s already installed, skipping...\n" "rustup"
else
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source "$HOME/.cargo/env"
fi

rustup component add rust-analyzer
ln -nsf $(rustup which --toolchain stable rust-analyzer) ~/bin/rust-analyzer
rustup component add clippy

install_cargo flamegraph
install_cargo tealdeer
install_cargo du-dust
install_cargo difftastic
install_cargo htmlq
install_cargo trunk
install_cargo cargo-watch
install_cargo git-delta
install_cargo mdbook
install_cargo git-branchless --locked
install_cargo bat --locked
install_cargo bottom --locked
# Used by an nvim plugin.
install_cargo ripgrep --features 'pcre2'
# This is used by the neovim tree-sitter plugin, for _some_ grammars.
install_cargo tree-sitter-cli

# Dependencies for alacritty.
# Running this section failed on my Mint install. The `python3` install could not complete
# successfully. To make troubleshooting a little easier, I've switched it to a separate install
# command.
install cmake
install pkg-config
install libfreetype6-dev
install libfontconfig1-dev
install libxcb-xfixes0-dev
install libxkbcommon-dev
install python3
install_cargo alacritty
sudo cp /home/jsimpson/.cargo/bin/alacritty /usr/local/bin
sudo cp /home/jsimpson/.cargo/registry/src/github.com-1ecc6299db9ec823/alacritty-0.11.0/extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install /home/jsimpson/.cargo/registry/src/github.com-1ecc6299db9ec823/alacritty-0.11.0/extra/linux/Alacritty.desktop
sudo update-desktop-database
[[ ! -e ~/.alacritty.yml ]] && ln -nsf ~/dotfiles/alacritty.yml ~/.alacritty.yml

go install github.com/jesseduffield/lazygit@latest

mkdir -p ~/.config
ln -nsf ~/dotfiles/nvim ~/.config/nvim
ln -nsf ~/.vim ~/.nvim
ln -nsf ~/dotfiles/nvim/init.vim ~/.vimrc
# This is the directory where backup files are written. For some reason Neovim
# doesn't create this itself. Or, it didn't at 10/29/2015.
mkdir -p ~/.local/share/nvim/backup

ln -nsf ~/dotfiles/psqlrc ~
ln -nsf ~/dotfiles/sqliterc ~
ln -nsf ~/dotfiles/gradle/gradle.properties ~

echo "Installing the Git configuration."
if grep "dotfiles.gitconfig" ~/.gitconfig >& /dev/null ; then
    echo "    The Git config settings are already installed. Skipping."
else
    echo '[include]
    path = ~/dotfiles/gitconfig
' >> ~/.gitconfig
fi

ln -nsf ~/dotfiles/hgrc ~/.hgrc
if [[ ! -e ~/.hgrc.local ]]; then
    echo "# Mercurial settings local to this machine" > ~/.hgrc.local
fi

ln -nsf ~/dotfiles/tmux.conf ~/.tmux.conf

echo "Installng Oh My Zsh"
if [[ -d ${HOME}/.oh-my-zsh ]]; then
    echo "    Oh My Zsh already installed. Skipping."
else
    pushd ${HOME}
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    popd
fi

echo "Installing zshrc settings."
if grep "source .*dotfiles.zshrc" ~/.zshrc >& /dev/null ; then
    echo "    zshrc settings already installed. Skipping."
else
    echo 'test -f ~/dotfiles/zshrc && source ~/dotfiles/zshrc' >> ~/.zshrc
fi

if uname -a | grep Darwin >& /dev/null ; then
    ${HOME}/dotfiles/install-macosx.sh
fi


# Browse the list here:
#    https://www.nerdfonts.com/font-downloads
# https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/OpenDyslexic.zip
# https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/AnonymousPro.zip
# https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FantasqueSansMono.zip
# https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Terminus.zip
install_font mononoki Mononoki
install_font Terminess Terminus
install_font Fantasque FantasqueSansMono

if grep 'XKBOPTIONS=""' /etc/default/keyboard >& /dev/null; then
    # https://thesynack.com/posts/persistent-capslock-behavior/
    echo
    echo "********************************************************************************"
    echo "It looks like the Capslock key override isn't installed."
    echo "Put this option in /etc/default/keyboard and reboot."
    echo
    echo 'XKBOPTIONS="caps:escape"'
    echo "********************************************************************************"
    echo
fi

echo

bash <(curl https://raw.githubusercontent.com/ellie/atuin/main/install.sh)
atuin import auto

