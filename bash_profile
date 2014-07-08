# vi: set ft=sh:let g:is_bash=1

# start screen on log in
#if [ -t 1 -a -z "$STY" ]; then
#  exec screen -ARR
#fi

# start ssh-agent and add key
# see also .logout
#SSHAGENT=`which ssh-agent`
#SSHAGENTARGS="-s"
#if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
#  eval `$SSHAGENT $SSHAGENTARGS`
#  trap "kill $SSH_AGENT_PID" 0
#  ssh-add
#fi

if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if [ "$(uname)" == "Darwin" ]; then
  alias updatedb="/usr/libexec/locate.updatedb"
  if [ -n "$(command -v brew)" ]; then
    export PATH="$(brew --prefix)/bin:$PATH"
  fi
  alias ls='ls -G'

  function whatismyip {
    curl -s -L http://checkip.dyndns.com/ | sed 's/^.*[[:<:]]\(\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\)[[:>:]].*$/\1/'
  }
else
  alias ls='ls --color=auto'

  function whatismyip {
    curl -s -L http://checkip.dyndns.com/ | sed -r 's/^.*\b([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})\b.*$/\1/'
  }
fi

function isitup {
  if [ -z "$1" ]; then
    echo "Usage: isitup URL"
    return
  fi

  curl "http://isitup.org/$1.json"
  echo
}

alias visudo='sudo -E visudo'

export EDITOR="$(which vim)"
export PATH="$HOME/.bin:$PATH"
