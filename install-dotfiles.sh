#!/bin/sh

# Install packages
sudo apt-get install neovim curl

# Configure nvim
mv ~/.config/nvim ~/.config/nvim.backup
ln -s ~/dotfiles/nvim ~/.config/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# Configure git
ln -s ~/dotfiles/gitconfig ~/.gitconfig
