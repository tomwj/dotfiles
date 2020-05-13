#!/bin/bash -x

packagesToCaskInstall=" \
iterm2 \
signal \
spotify \
virtualbox\
intellij-idea-ce \
meld \
"

packagesToInstall="\
jsawk \
ansible \
docker \
docker-compose \
fzf \
git \
kubectl \
nodejs \
npm \
neovim \
shellcheck \
the_silver_searcher \
thefuck \
jq \
"

function setupRCFile {
  rcfile=~/."$1"
  # Configure git
  if [[ -f $rcfile ]]; then
    mv "$rcfile" "$rcfile.bkp"
  fi
  ln -s "$HOME/$rcfile" "$HOME/src/github.com/tomwj/dotfiles/$1"
}

case "$(uname -s)" in

   Darwin)
     echo 'Mac OS X'
	echo "Running on OSX"
	if command -v brew; then
		echo "Installing packages "
		brew cask install $packagesToCaskInstall
		brew install $packagesToInstall
	else
		echo "Please install brew"
		exit
	fi
     ;;

   Linux)
     echo 'Linux'
     exit
     ;;

   CYGWIN*|MINGW32*|MSYS*)
     echo 'MS Windows'
     exit
     ;;

   # Add here more strings to compare
   # See correspondence table at the bottom of this answer

   *)
     echo 'Other OS' 
     exit
     ;;
esac

echo "Setting up gh on zsh"
	
# Setup gh
mkdir -p ~/src/github.com/jdxcode/gh
cd ~/src/github.com/jdxcode || exit
git clone git@github.com:jdxcode/gh.git
typeset +gx -A GITHUB
GITHUB[user]=jdxcode
ln -s ~/src/github.com/jdxcode/gh/zsh/gh ~/.oh-my-zsh/custom/plugins/gh
source ~/.zshrc 

# sudo apt-get update && sudo apt-get install -y apt-transport-https
# sudo apt-get install -y curl 
# curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
# sudo apt-get update
# Install packages
# sudo pacman -S neovim $packagesToInstall


# python-pkg-resources mv ~/.config/nvim ~/.config/nvim.backup 
# Configure nvim
#curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
pip install neovim
pip3 install neovim
npm install -g neovim
setupRCFile vimrc
setupRCFile nvim
setupRCFile gitconfig
setupRCFile bashrc
setupRCFile aignore


