[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
[[ -f ~/.zsh/macos.zsh ]] && source ~/.zsh/macos.zsh
[[ -f ~/.zsh/locales.zsh ]] && source ~/.zsh/locales.zsh

# Load Starship
eval "$(starship init zsh)"

clear

# Prompt neofetch
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
  neofetch
fi

[[ -f ~/.zsh/check_reboots.zsh ]] && ~/.zsh/check_reboots.zsh
