# Load any supplementary scripts
for config in "$HOME"/dotfiles/bashrc.d/*.bash ; do
    source "$config"
done
unset -v config

# If we're running in Windows setup docker
if [[ $(uname -v) == *"Microsoft"* ]]; then 
  # Assume running docker with Hyper-V not via virtualbox
  # export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
  # export PATH="$PATH:/mnt/c/Program\ Files/Docker/Docker/resources/bin"
  # alias docker=docker.exe
  # alias docker-compose=docker-compose.exe
  # alias docker-machine=docker-machine.exe

  # Taken from https://help.github.com/articles/working-with-ssh-key-passphrases/#auto-launching-ssh-agent-on-git-for-windows
  ssh-add
  env=~/.ssh/agent.env
  
  agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
  
  agent_start () {
      (umask 077; ssh-agent >| "$env")
      . "$env" >| /dev/null ; }
  
  agent_load_env
  
  # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
  agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
  
  if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
      agent_start
      ssh-add
  elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
      ssh-add
  fi
  
  unset env
fi

alias vim=/usr/bin/nvim
alias vi=vim

export PATH=$PATH:~/dotfiles/bin
export PATH=$PATH:~/bin
source ~/src/github.com/jdxcode/gh/bash/gh.bash
source ~/src/github.com/jdxcode/gh/completions/gh.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/t/.sdkman"
[[ -s "/home/t/.sdkman/bin/sdkman-init.sh" ]] && source "/home/t/.sdkman/bin/sdkman-init.sh"
export PATH=$PATH:/home/t/dotfiles/bin:/home/t/bin
# Remove so jx's version of terraform doesn't conflict
# export PATH=$PATH:~/.jx/bin
export PATH=$PATH:/home/t/.gem/ruby/2.6.0/bin
