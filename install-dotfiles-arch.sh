#!/bin/bash -x

function setupRCFile {
  rcfile=~/.$1
  # Configure git
  if [[ -f $rcfile ]]; then
    mv $rcfile $rcfile.bkp
  fi
  ln -s ~/dotfiles/$1 $rcfile
}

sudo apt-get update && sudo apt-get install -y apt-transport-https
sudo apt-get install -y curl 
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
# Install packages
sudo pacman -S neovim \
	             curl \
		     ansible \
		     npm \
                     silversearcher-ag \
		     thefuck \
		     kubectl \
		     nodejs \
		     git \
		     shellcheck
                     python-apache-libcloud

# Setup gh
mkdir -p ~/src/github.com/jdxcode/gh
cd ~/src/github.com/jdxcode
git clone git@github.com:jdxcode/gh.git

python-pkg-resources mv ~/.config/nvim ~/.config/nvim.backup 
# Configure nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
ln -s nvim ~/.config/nvim
setupRCFile vimrc
setupRCFile gitconfig
setupRCFile bashrc


