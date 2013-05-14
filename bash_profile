# start screen on log in
#if [ -z "$STY" ]; then
#  exec screen -ARR
#fi

if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

alias ls='ls --color'

# try using homebrew coreutils, otherwise just fix ls
if [[ $(uname -s) == 'Darwin' ]]; then

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
fi

alias visudo='sudo -E visudo'

export EDITOR=$(which vim)
export PATH="$PATH:$HOME/.bin"

function whatismyip {
  curl -s -L -A "Mozilla" http://aruljohn.com/ | grep 'Your IP Address is ' | sed 's/^.*is \([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\)<.*$/\1/'
}

function isitup {
  curl "http://isitup.org/$1.json"
  echo
}

function httpports {
  # $1 is URL
  if ! [[ -z "$1" ]] ; then
    URL="$1"
  else
    echo "usage: httpports URL [port]"
    echo "       httpports URL [begin port] [end port]"
    echo
    echo "If no port is specified, httpports will scan over the range 1..65535."
    return
  fi
  
  # $2 is BEGIN port
  if [[ "$2" =~ ^[0-9]+$ ]] ; then
    BEGIN=$2
  else
    BEGIN=1
  fi
  
  # $3 is END port
  if  [[ "$3" =~ ^[0-9]+$ ]] ; then
    END=$3
  elif ! [[ -z "$2" ]] ; then
    END=$BEGIN
  else
    END=65535
  fi
  
  # GOGOGO
  for port in $(seq $BEGIN $END) ; do
    curl -sSLI --max-time 1 $URL:$port 2>&1 |
    grep "HTTP" |
    sed "s/^/Port $port: /"
  done
}
