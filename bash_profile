if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

if [ "$(uname)" == "Darwin" ]; then
  alias updatedb="/usr/libexec/locate.updatedb"
  if command -v brew &>/dev/null ; then
    export PATH="$(brew --prefix)/bin:$PATH"
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

  curl "http://isitup.org/${1}.json"
  echo
}

alias visudo='sudo -E visudo'
export EDITOR="$(which vim)"
export PATH="$HOME/.bin:$PATH"
