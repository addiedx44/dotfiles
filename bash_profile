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
  alias updatedb="sudo /usr/libexec/locate.updatedb"

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

# macports
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# heroku
#PATH="/usr/local/heroku/bin:$PATH"
