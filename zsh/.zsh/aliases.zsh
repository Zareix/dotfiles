alias grep="grep --color"
alias json="jq"
alias ..="cd .."
alias ls="eza --icons --group-directories-first"
alias ll="ls -l"
alias lsl="ls -l"
alias lslg="ls -lg"
alias lsa="ls -a"
alias lsal="ls -al"
alias lsla="ls -al"
alias lsalg="ls -alg"
alias lslag="ls -alg"
alias lt="ls --tree"
alias tree="lt"
if ! type "batcat" &>/dev/null; then
    alias cat="bat --theme=OneHalfDark"
else
    alias cat="batcat --theme=OneHalfDark"
fi
alias py="python"
alias tf="tofu"
alias d="docker"
alias dc="docker compose"
alias dup="docker compose up -d"
# alias dup-dev="docker compose -f docker-compose.dev.yml up -d"

if [ "$EUID" -eq 0 ]; then
    alias sudo=""
else
    alias sudo="sudo "
fi

function dc-dev() {
    if [ -f "docker-compose.dev.yml" ]; then
        docker compose -f docker-compose.dev.yml "$@"
    elif [ -f "docker-compose.dev.yaml" ]; then
        docker compose -f docker-compose.dev.yaml "$@"
    elif [ -f "compose.dev.yaml" ]; then
        docker compose -f compose.dev.yaml "$@"
    elif [ -f "compose.dev.yml" ]; then
        docker compose -f compose.dev.yml "$@"
    else
        echo "No docker-compose.dev.yml / docker-compose.dev.yaml / compose.dev.yaml / compose.dev.yml found"
    fi
}

function dup-dev() {
    if [ -f "docker-compose.dev.yml" ]; then
        docker compose -f docker-compose.dev.yml up -d
    elif [ -f "docker-compose.dev.yaml" ]; then
        docker compose -f docker-compose.dev.yaml up -d
    elif [ -f "compose.dev.yaml" ]; then
        docker compose -f compose.dev.yaml up -d
    elif [ -f "compose.dev.yml" ]; then
        docker compose -f compose.dev.yml up -d
    else
        echo "No docker-compose.dev.yml / docker-compose.dev.yaml / compose.dev.yaml / compose.dev.yml found"
    fi
}

function ippublic() {
    curl http://ident.me
}

function iplocal() {
    ifconfig | grep "inet " | grep -i mask | awk '{print $2}' | cut -f2 -d:
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

function px() {
    if [[ -f bun.lockb ]]; then
        command bunx "$@"
    elif [[ -f pnpm-lock.yaml ]]; then
        command pnpx "$@"
    elif [[ -f yarn.lock ]] || [[ -f package-lock.json ]]; then
        command npx "$@"
    else
        command bunx "$@"
    fi
}

function pyenv() {
    if [[ ! -f .venv ]]; then
        uv venv "$@"
    fi
    source .venv/bin/activate
}
