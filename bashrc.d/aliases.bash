# Quick completion for _did you mean_ command responses. Yes ovbiously I fucking did, moron.
eval $(thefuck --alias)
alias fuck-it='THEFUCK_REQUIRE_CONFIRMATION=False fuck'
alias fuckit=fuck-it

# git
alias git-ca="git add --all; git commit -m $1"
alias gs="git status"
alias latestbranches="git for-each-ref --sort=-committerdate refs/heads/"
alias difflast="git log | grep -e commit | head -10 | sed -n '2p' | sed 's/commit//g' | xargs git diff"

# ansible
alias ash=ansible-ssh
apb='[ ! -z "$ANSIBLE_BECOME_PASS" ] && ansible-playbook -e "ansible_become_pass=$ANSIBLE_BECOME_PASS"'

# exports
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk/

# Make commands colourful
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Default terminal to use X11 so rescuetime works
export GDK_BACKEND=x11

export GOPATH=/home/t/
