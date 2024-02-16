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
alias dup="docker compose up -d"
alias dup-dev="docker compose -f docker-compose.dev.yml up -d"

if [ "$EUID" -eq 0 ]; then
    alias sudo=""
fi
