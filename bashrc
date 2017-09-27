# Load the shell dotfiles, and then some:

# List of brew packages to install:
# $ brew leaves
# brew install git hub lynx mtr neovim/neovim/neovim node pyenv-virtualenv python thefuck tmux
for file in ~/dotfiles/{path,bash_prompt,bash_profile,exports,aliases,functions,extra,secrets}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Quick completion for _did you mean_ command responses. Yes ovbiously I fucking did, moron.
eval $(thefuck --alias)
alias fuck-it='THEFUCK_REQUIRE_CONFIRMATION=False fuck'
alias fuckit=fuck-it

<<<<<<< HEAD
# Share history across shells
# Avoid duplicates
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='ls:bg:fg:history'
export HISTSIZE=2000000
export HISTFILESIZE=$HISTSIZE
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
# Print time with history
export HISTTIMEFORMAT="%y-%m-%d %T "


=======
>>>>>>> c9bf072b7517f41dd17e49cdb6f151fc00244c0d
function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

for al in `__git_aliases`; do
    alias g$al="git $al"
    
    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_fnc && __git_complete g$al $complete_func
done

export CLICOLOR=1

# git
alias git-ca="git add --all; git commit -m $1"
alias gs="git status"
alias latestbranches="git for-each-ref --sort=-committerdate refs/heads/"
alias difflast="git log | grep -e commit | head -10 | sed -n '2p' | sed 's/commit//g' | xargs git diff"
source ~/.git-completion.bash

alias differ="echo -ne '\x0D\x0A\x0D\x0A\x0D\x0A\x0D\x0A############################ start ##################################\x0D\x0A\x0D\x0A\x0D\x0A\x0D\x0A' && git diff --color | diff-so-fancy"
#export AWS_CREDENTIAL_FILE=~/.elasticbeanstalk/az_aws_credential_file

# Terraform
export PATH=$PATH:$HOME/terraform:/usr/local/terraform/bin
sshtun () {
  if [[ -z "$1" || -z "$2" || -z "$3" || -z "$4" || -z "$5" ]]; then
    echo "Usage: $0 local_port identity_file gateway_host target_host target_port"
  else
    ssh -o IdentitiesOnly=yes -o "UserKnownHostsFile /dev/null" -F /dev/null -i $2 -Nf -L $1:$4:$5 $3
  fi
}
aws_set_env () {
  aws configure --profile "$1"
  export AWS_DEFAULT_PROFILE="$1"
  export AWS_PROFILE="$1"
  export AWS_EB_PROFILE="$1"
}
_aws_set_env()
{
    local cur
    cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=()
    _get_comp_words_by_ref cur
    COMPREPLY=( $( compgen -W "$(grep -E '\[(.*)\]' ~/.aws/credentials | tr -d '[]' | xargs printf '%s ')" -- "$cur" ) )
    return 0
} &&
complete -F _aws_set_env aws_set_env
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh
export ANDROID_HOME=~/Library/Android/sdk
alias inoket='source ../sourceMe.sh && source venv/bin/activate && python application.py runserver'
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export NODE_ENV='development'
export PATH=$PATH:/usr/local/m-cli
# source ~/src/github.com/dickeyxxx/gh/bash/gh.bash
# _complete_gh ()
# {
#         COMPREPLY=()
#         if [[ $COMP_CWORD -eq 1 ]]; then
#           comp_arr=$(ls $HOME/src/github.com;\
#             ls $HOME/src/github.com/$GITHUB)
#         elif [[ $COMP_CWORD -eq 2 ]]; then
#           local user=${COMP_WORDS[COMP_CWORD-1]}
#           comp_arr=$(ls $HOME/src/github.com/$user)
#         else
#           return 0
#         fi
#         cur="${COMP_WORDS[COMP_CWORD]}"
#         COMPREPLY=( $(compgen -W "${comp_arr}" -- $cur))
#         return 0
# }
complete -F _complete_gh gh

# make ctrl+w/cmd+w stop on slashes etc.
stty werase undef
bind '\C-w:unix-filename-rubout'


export LC_CTYPE=en_US.UTF-8

## arrow up
bind '"<Up>":history-search-backward'

## arrow down
bind '"<Down>":history-search-forward'

# Setup editors
export NVIM=$(which nvim)
export EDITOR=$NVIM
export GIT_EDITOR=$NVIM
alias vim=$NVIM

# Increase limit of maximum open files
# changes that need to be applied to kernel
# 
# /Library/LaunchDaemons/limit.maxfiles.plist
# --
# <?xml version="1.0" encoding="UTF-8"?>  
# <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"  
#         "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
# <plist version="1.0">  
#   <dict>
#     <key>Label</key>
#     <string>limit.maxfiles</string>
#     <key>ProgramArguments</key>
#     <array>
#       <string>launchctl</string>
#       <string>limit</string>
#       <string>maxfiles</string>
#       <string>64000</string>
#       <string>524288</string>
#     </array>
#     <key>RunAtLoad</key>
#     <true/>
#     <key>ServiceIPC</key>
#     <false/>
#   </dict>
# </plist> 
# $ sudo chown root:wheel /Library/LaunchDaemons/limit.maxfiles.plist
# $ sudo launchctl load -w /Library/LaunchDaemons/limit.maxfiles.plist
# Check changes were applied
# $ launchctl limit maxfiles
# https://superuser.com/questions/827984/open-files-limit-does-not-work-as-before-in-osx-yosemite/828010#828010
# ulimit -n 1000000 unlimited

# Fuzzy search
# https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
apb='[ ! -z "$ANSIBLE_BECOME_PASS" ] && ansible-playbook -e "ansible_become_pass=$ANSIBLE_BECOME_PASS"'
