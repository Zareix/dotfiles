if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

P10K_HOME=$HOME/.p10k

if [ ! -d "$P10K_HOME" ]; then
   mkdir -p "$(dirname $P10K_HOME)"
   git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_HOME"
fi

source "$P10K_HOME/powerlevel10k.zsh-theme"

[[ -f ~/.zsh/env.zsh ]] && source ~/.zsh/env.zsh
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/distro.zsh ]] && source ~/.zsh/distro.zsh
[[ -f ~/.zsh/locales.zsh ]] && source ~/.zsh/locales.zsh
[[ -f ~/.zsh/linux.zsh ]] && source ~/.zsh/linux.zsh
[[ -f ~/.zsh/macos.zsh ]] && source ~/.zsh/macos.zsh

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Load zoxide
eval "$(zoxide init --cmd cd zsh)"

# Load p10k
source ~/.p10k.zsh
[[ -f ~/.zsh/p10k-custom.zsh ]] && source ~/.zsh/p10k-custom.zsh

# Prompt fastfetch when not in VSCode
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
  fastfetch --logo $DISTRO
fi
