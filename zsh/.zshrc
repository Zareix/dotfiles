[[ -f ~/.zsh/env.zsh ]] && source ~/.zsh/env.zsh
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
[[ -f ~/.zsh/locales.zsh ]] && source ~/.zsh/locales.zsh
[[ -f ~/.zsh/linux.zsh ]] && source ~/.zsh/linux.zsh
[[ -f ~/.zsh/macos.zsh ]] && source ~/.zsh/macos.zsh

_hostname=$(hostname)

if [[ $_hostname == *rpi* || $_hostname == *raspberry* ]]; then
  [[ -f ~/.zsh/rpi.zsh ]] && source ~/.zsh/rpi.zsh
fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Load Starship
eval "$(starship init zsh)"

# Prompt neofetch
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
  if [[ $_hostname == *rpi* || $_hostname == *raspberry* ]]; then
    neofetch --ascii_distro Raspbian
  else
    neofetch
  fi
fi

[[ -f ~/.zsh/check_reboots.zsh ]] && ~/.zsh/check_reboots.zsh

# bun completions
[ -s "/Users/raphaelgc/.bun/_bun" ] && source "/Users/raphaelgc/.bun/_bun"
