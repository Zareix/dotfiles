[[ -f /etc/bashrc.d/dietpi.bash ]] && source /etc/bashrc.d/dietpi.bash

alias shutdown="echo 'Please do not use this command. Use the command xoff instead.'"
alias xoff='sudo /usr/local/bin/x-c1-softsd.sh'
