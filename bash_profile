if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

alias ls='ls --color'

# try using homebrew coreutils, otherwise just fix ls
if [[ `uname -s` == 'Darwin' ]]; then

  # assuming you have mysql somewhere
  # export PATH="$PATH:/usr/local/mysql/bin"
  # export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/mysql/lib/"

  # the PATH below sets up the GNU coreutils to override the default BSD ones
  if [[ `command -v brew` && `brew list | grep coreutils` = 'coreutils' ]]; then
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  else
    alias ls='ls -G'
  fi
fi

alias visudo='sudo -E visudo'

export EDITOR=$(which vim)
export PATH="$PATH:$HOME/.bin"

function whatismyip {
  # this has the potential to break in the future if whatismyip.net changes how
  # they display the ip
  curl whatismyip.net 2>/dev/null | grep strong | sed -E 's/^.*\>(([0-9]+\.?){4}).*$/\1/'
}

function isitup {
  curl "http://isitup.org/$1.json"
  echo
}
