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


alias differ="echo -ne '\x0D\x0A\x0D\x0A\x0D\x0A\x0D\x0A############################ start ##################################\x0D\x0A\x0D\x0A\x0D\x0A\x0D\x0A' && git diff --color | diff-so-fancy"
complete -F _complete_ssh_hosts ssh
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
