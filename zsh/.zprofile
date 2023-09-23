# include .zshrc if it exists
if [ -f "$HOME/.zshrc" ] && [ -z "$PS1+x" ]; then
    . "$HOME/.zshrc"
fi
