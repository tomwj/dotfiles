# Quick completion for _did you mean_ command responses. Yes ovbiously I fucking did, moron.
eval $(thefuck --alias)
alias fuck-it='THEFUCK_REQUIRE_CONFIRMATION=False fuck'
alias fuckit=fuck-it

# git
alias git-ca="git add --all; git commit -m $1"
alias gs="git status"
alias latestbranches="git for-each-ref --sort=-committerdate refs/heads/"
alias difflast="git log | grep -e commit | head -10 | sed -n '2p' | sed 's/commit//g' | xargs git diff"
