# Load pyenv
eval "$(pyenv init -)"

# Load fnm
eval "$(fnm env --use-on-cd)"

# Bun completions
[ -s "/Users/raphaelgc/.bun/_bun" ] && source "/Users/raphaelgc/.bun/_bun"

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias batcat="bat"
alias dup="docker compose up -d"
alias bwsession="bwses"
alias bwunlock="bwses"

function bwses() {
    BW_SESSION=$(bw unlock --raw)
    export BW_SESSION
}
