# remove keys and kill ssh-agent
#if [ ${SSH_AGENT_PID+1} == 1 ]; then
#  ssh-add -D
#  ssh-agent -k &>/dev/null
#  unset SSH_AGENT_PID
#  unset SSH_AUTH_SOCK
#fi
