# ---- UTILS ----
function detect_filenames() {
  _p9k_upglob "$1" -.
  local -i idx=$?
  if (($idx > 0)); then
    return 0
  fi
  return 1

  # for filename in "$@"; do
  #   if [ -f "$filename" ]; then
  #     return 0
  #   fi
  # done
  # return 1
}

function detect_folders() {
  # _p9k_upglob "$1" -.
  # local -i idx=$?
  # echo "DEBUG: detect_folder: idx=$idx, args=$*"
  # if (($idx > 0)); then
  #   return 0
  # fi
  # return 1
  for foldername in "$@"; do
    if [ -d "$foldername" ]; then
      return 0
    fi
  done
  return 1
}

function detect_file_extensions() {
  _p9k_upglob "$1" -.
  local -i idx=$?
  if (($idx > 0)); then
    return 0
  fi
  return 1
  # for extension in "$@"; do
  #   files=($(find ./ -maxdepth 1 -name "*.$extension"))
  #   if [ ${#files[@]} -gt 0 ]; then
  #     return 0
  #   fi
  # done
  # return 1
}

# ---- RIGHT PROMPT ----
function prompt_my_bun_version() {
  local version=""
  if detect_filenames "bun.lock*"; then
    vtemp=$(bun --version 2>/dev/null || echo "unknown")
    version="🍞 $vtemp"
  fi
  p10k segment -t "$version" -f sandybrown
}

function prompt_my_node_version() {
  local version=""
  if detect_filenames "package-lock.json|yarn.lock|pnpm-lock.yaml"; then
    vtemp=$(node --version 2>/dev/null || echo "unknown")
    version="󰎙 $vtemp"
  fi
  p10k segment -t "$version" -f green
}

function prompt_my_terraform_version() {
  local version=""
  if detect_file_extensions "*.tf"; then
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

function prompt_my_kube_context() {
  if command -v kubectl &>/dev/null; then
    local is_cluster_running=$(kubectl cluster-info 2>/dev/null | grep -q "is running" && echo "yes" || echo "no")
    if [[ "$is_cluster_running" == "no" ]]; then
      p10k segment -t ""
      return
    fi
    local context=$(kubectl config current-context 2>/dev/null)
    if [[ -z "$context" ]]; then
      context="default"
    fi
    local namespace=$(kubectl config view --minify -o jsonpath='{..namespace}' 2>/dev/null)
    if [[ -z "$namespace" ]]; then
      namespace="default"
    fi
    p10k segment -t "☸️  $context/$namespace" -f blue
  else
    p10k segment -t ""
  fi
}

function prompt_my_python_version() {
  local version=""
  if detect_folders ".venv"; then
    vtemp=$(./.venv/bin/python --version 2>&1 | awk '{print $2}' || echo "unknown")
    version="🐍 $vtemp"
  elif detect_file_extensions "*.py"; then
    vtemp=$(python3 --version 2>&1 | awk '{print $2}' || echo "unknown")
    version="🐍 $vtemp"
  fi
  p10k segment -t "$version" -f magenta
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
