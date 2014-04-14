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

alias ls='ls --color'

if [ "$(uname -s)" = 'Darwin' ]; then

  alias updatedb="/usr/libexec/locate.updatedb"
  alias ls='ls -G'

  if [ -n "$(command -v brew)" ]; then
    export PATH="$(brew --prefix)/bin:$PATH"

    if [ "$(brew list | grep coreutils)" = 'coreutils' ]; then
      export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
    fi
  fi

  function whatismyip {
    curl -s -L http://checkip.dyndns.com/ | sed 's/^.*[[:<:]]\(\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\)[[:>:]].*$/\1/'
  }

else

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
export PATH="$PATH:$HOME/.bin"

# macports
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# heroku
#PATH="/usr/local/heroku/bin:$PATH"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
