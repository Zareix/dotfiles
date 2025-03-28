# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias python="python3"

# If host is a Raspberry Pi
_hostname=$(hostname)
if [[ $_hostname == *rpi* || $_hostname == *raspberry* ]]; then
  return 0

  [[ -f /etc/bashrc.d/dietpi.bash ]] && source /etc/bashrc.d/dietpi.bash

  alias shutdown="echo 'Please do not use this command. Use the command xoff instead.'"
  alias xoff='sudo /usr/local/bin/x-c1-softsd.sh'

  export NEOFETCH_OS="Raspbian"
fi
