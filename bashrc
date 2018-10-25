# Load any supplementary scripts
for config in "$HOME"/dotfiles/bashrc.d/*.bash ; do
    source "$config"
done
unset -v config

# If we're running in Windows setup docker
if [[ $(uname -v) == *"Microsoft"* ]]; then 
  export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
  export PATH="$PATH:/mnt/c/Program\ Files/Docker/Docker/resources/bin"
  alias docker=docker.exe
  alias docker-compose=docker-compose.exe
fi

export PATH=$PATH:~/dotfiles/bin
source ~/src/github.com/jdxcode/gh/bash/gh.bash
source ~/src/github.com/jdxcode/gh/completions/gh.bash
