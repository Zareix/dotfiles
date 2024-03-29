function ippublic() {
  curl http://ident.me
}

function iplocal() {
  ifconfig | grep "inet " | grep -i mask | awk '{print $2}' | cut -f2 -d:
}

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

function p() {
  if [[ -f bun.lockb ]]; then
    command bun "$@"
  elif [[ -f pnpm-lock.yaml ]]; then
    command pnpm "$@"
  elif [[ -f yarn.lock ]]; then
    command yarn "$@"
  elif [[ -f package-lock.json ]]; then
    command npm "$@"
  else
    command bun "$@"
  fi
}
