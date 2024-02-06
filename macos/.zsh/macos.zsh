eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# Load fnm
eval "$(fnm env --use-on-cd)"

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias batcat="bat"
alias bwsession="bwses"
alias bwunlock="bwses"
alias python="python3"

function bwses() {
    BW_SESSION=$(bw unlock --raw)
    export BW_SESSION
}

# bun completions
[ -s "/Users/raphaelgc/.bun/_bun" ] && source "/Users/raphaelgc/.bun/_bun"
