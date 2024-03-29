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
alias cat="batcat --theme=OneHalfDark"
alias py="python"
alias tf="terraform"
alias d="docker"
alias dc="docker compose"
alias dup="docker compose up -d"
# alias dup-dev="docker compose -f docker-compose.dev.yml up -d"

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

if [ "$EUID" -eq 0 ]; then
    alias sudo=""
fi
