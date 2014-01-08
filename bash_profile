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

# try using homebrew coreutils, otherwise just fix ls
if [[ $(uname -s) == 'Darwin' ]]; then
  alias updatedb="/usr/libexec/locate.updatedb"

  # assuming you have mysql somewhere
  # export PATH="$PATH:/usr/local/mysql/bin"
  # export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/mysql/lib/"

  # the PATH below sets up the GNU coreutils to override the default BSD ones
  if [[ $(command -v brew) && $(brew list | grep coreutils) = 'coreutils' ]]; then
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  else
    alias ls='ls -G'
  fi

  if [[ $(command -v brew) ]]; then
    export PATH="$(brew --prefix)/bin:$PATH"
  fi

  function whatismyip
  {
    curl -s -L http://checkip.dyndns.com/ | sed 's/^.*[[:<:]]\(\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\)[[:>:]].*$/\1/'
  }
else
  function whatismyip {
    curl -s -L http://checkip.dyndns.com/ | sed -r 's/^.*\b([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})\b.*$/\1/'
  }
fi

alias visudo='sudo -E visudo'

export EDITOR=$(which vim)
export PATH="$PATH:$HOME/.bin"

function isitup {
  curl "http://isitup.org/$1.json"
  echo
}

# macports
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# heroku
#PATH="/usr/local/heroku/bin:$PATH"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
