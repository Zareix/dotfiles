[[ -f ~/.zsh/env.zsh ]] && source ~/.zsh/env.zsh
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
[[ -f ~/.zsh/distro.zsh ]] && source ~/.zsh/distro.zsh
[[ -f ~/.zsh/locales.zsh ]] && source ~/.zsh/locales.zsh
[[ -f ~/.zsh/linux.zsh ]] && source ~/.zsh/linux.zsh
[[ -f ~/.zsh/macos.zsh ]] && source ~/.zsh/macos.zsh

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Prompt fastfetch
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
  fastfetch --logo $DISTRO
fi

# Load zoxide
eval "$(zoxide init --cmd cd zsh)"

# Load Starship
eval "$(starship init zsh)"

[[ -f ~/.zsh/check_reboots.zsh ]] && ~/.zsh/check_reboots.zsh
