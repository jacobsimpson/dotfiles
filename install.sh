#! /bin/bash

echo

#echo "Set the shell to zshrc."
#chsh -s /bin/zsh

echo "Installing VimPlug for vim plugin management."
if [[ -e ~/.local/share/nvim/site/autoload/plug.vim ]] ; then
    echo "    Already installed."
else
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

mkdir -p ~/.config
ln -nsf ~/dotfiles/nvim ~/.config/nvim
ln -nsf ~/.vim ~/.nvim
ln -nsf ~/dotfiles/nvim/init.vim ~/.vimrc
# This is the directory where backup files are written. For some reason Neovim
# doesn't create this itself. Or, it didn't at 10/29/2015.
mkdir ~/.local/share/nvim/backup

ln -nsf ~/dotfiles/psqlrc ~
ln -nsf ~/dotfiles/sqliterc ~

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

echo
