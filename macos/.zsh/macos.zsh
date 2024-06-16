eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# Load fnm
eval "$(fnm env --use-on-cd --log-level quiet)"

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias batcat="bat"
alias bwsession="bwses"
alias bwunlock="bwses"
alias python3="python3.12"
alias python="python3"
alias oif="open $PWD"
alias ofd="open $PWD"

function pfd() {
    osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (insertion location as alias)
    end tell
EOF
}

function cdf() {
    cd "$(pfd)"
}

function clipcopy() {
    pbcopy <"${1:-/dev/stdin}"
}

function copypath {
    local file="${1:-.}"
    [[ $file = /* ]] || file="$PWD/$file"
    print -n "${file:a}" | clipcopy || return 1
    echo \"${file:a}\" copied to clipboard.
}

function bwses() {
    BW_SESSION=$(bw unlock --raw)
    export BW_SESSION
}
