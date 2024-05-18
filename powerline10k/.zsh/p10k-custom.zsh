# ---- UTILS ----
function detect_filenames() {
  for filename in "$@"; do
    if [ -f "$filename" ]; then
      return 0
    fi
  done
  return 1
}

function detect_file_extensions() {
  for extension in "$@"; do
    files=($(find ./ -maxdepth 1 -name "*.$extension"))
    if [ ${#files[@]} -gt 0 ]; then
      return 0
    fi
  done
  return 1
}

# ---- RIGHT PROMPT ----
function prompt_my_bun_version() {
  local version=""
  if detect_filenames "bun.lockb"; then
    version="🍞 $(bun --version)"
  fi
  p10k segment -t "$version"
}

function prompt_my_node_version() {
  local version=""
  if detect_filenames "package-lock.json" "yarn.lock" "pnpm-lock.yaml"; then
    version="󰎙 $(node --version)"
  fi
  p10k segment -t "$version" -f green
}

function prompt_my_terraform_version() {
  local version=""
  if detect_file_extensions "tf"; then
    version="󱁢 $(terraform version -json | jq -r .terraform_version)"
  fi
  p10k segment -t "$version" -f magenta
}

function prompt_my_docker_context() {
  local context=""
  if [[ -n $DOCKER_HOST ]]; then
    context="🐳 $DOCKER_HOST"
  fi
  p10k segment -t "$context" -f blue
}

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=my_bun_version
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=my_node_version
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=my_terraform_version
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=my_docker_context

# ---- LEFT PROMPT ----
function prompt_my_distro_icon() {
  p10k segment -t "$DISTRO_ICON" -f white
}

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=("my_distro_icon" "${POWERLEVEL9K_LEFT_PROMPT_ELEMENTS[@]}")
