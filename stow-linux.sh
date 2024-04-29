#!/bin/sh

#stow --adopt git nano fastfetch starship zsh linux
r=$(realpath $HOME/dotfiles) && target=${r%/*} || echo "Error!!"
stow --adopt git nano fastfetch starship zsh linux -t $target
