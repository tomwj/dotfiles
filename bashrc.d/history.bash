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
