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
    vtemp=$(bun --version 2>/dev/null || echo "unknown")
    version="🍞 $vtemp"
  fi
  p10k segment -t "$version"
}

function prompt_my_node_version() {
  local version=""
  if detect_filenames "package-lock.json" "yarn.lock" "pnpm-lock.yaml"; then
    vtemp=$(node --version 2>/dev/null || echo "unknown")
    version="󰎙 $vtemp"
  fi
  p10k segment -t "$version" -f green
}

function prompt_my_terraform_version() {
  local version=""
  if detect_file_extensions "tf"; then
    vtemp=$(tofu version -json 2>/dev/null || echo "{ \"terraform_version\": \"unknown\" }")
    version="󱁢 $(echo "$vtemp" | jq -r '.terraform_version')"
  fi
  p10k segment -t "$version" -f magenta
}

function prompt_my_docker_context() {
  local context=""
  local docker_context=$(docker context show 2>/dev/null || echo "default")
  if [[ "$docker_context" != "default" && "$docker_context" != "orbstack" ]]; then
    context="🐳/$docker_context"
  fi
  p10k segment -t "$context" -f blue
}

function prompt_my_check_reboot() {
  local reboot=""
  if [[ -f /var/run/reboot-required ]]; then
    reboot="🔄 required"
  fi
  p10k segment -t "$reboot" -f red
}

function prompt_my_context() {
  local context=""
  if [ "$(whoami)" = "root" ]; then
    context="%F{#FF5C57}$(whoami)%f%F{242}@$(hostname)%f"
  else
    context="%F{#F1F1F0}$(whoami)%f%F{242}@$(hostname)%f"
  fi
  p10k segment -t "$context"
}

# ---- LEFT PROMPT ----
function prompt_my_distro_icon() {
  p10k segment -t "$DISTRO_ICON" -f white
}
