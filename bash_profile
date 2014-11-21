if [ -f $HOME/.bashrc ] ; then
  . $HOME/.bashrc
fi

function whatismyip {
  if [ "$1" = "--bsd" ] ; then
    curl -s -L http://checkip.dyndns.com/ | sed 's/^.*[[:<:]]\(\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\)[[:>:]].*$/\1/'
  else
    curl -s -L http://checkip.dyndns.com/ | sed -r 's/^.*\b([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})\b.*$/\1/'
  fi
}

if [ "$(uname)" == "Darwin" ] ; then
  alias updatedb="/usr/libexec/locate.updatedb"
  alias whatismyip="whatismyip --bsd"

  if command -v brew &>/dev/null ; then
    export PATH="$(brew --prefix)/sbin:$(brew --prefix)/bin:$PATH"

    if brew info coreutils &>/dev/null ; then
      export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
      export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    fi

    if brew info gnu-sed &>/dev/null ; then
      export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
      export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
      unalias whatismyip
    fi
  fi
fi

function isitup {
  if [ -z "$1" ] ; then
    echo "Usage: isitup URL"
    return
  fi

  curl "http://isitup.org/${1}.json"
  echo
}

alias sudo='sudo '
alias visudo='sudo -E visudo'
export EDITOR="$(which vim)"
export PATH="$HOME/.bin:$PATH"
