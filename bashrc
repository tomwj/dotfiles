# Load any supplementary scripts
for config in "$HOME"/dotfiles/bashrc.d/*.bash ; do
    source "$config"
done
unset -v config
