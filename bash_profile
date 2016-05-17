if [ -f $HOME/.bashrc ] ; then
  . $HOME/.bashrc
fi

if [ -f $HOME/.bash_functions ] ; then
  . $HOME/.bash_functions
fi

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

export EDITOR="$(which vim)"
export PATH="$HOME/.bin:$PATH"

alias sudo='sudo '
alias visudo='sudo -E visudo'

export WORKON_HOME=$HOME/.virtualenvs
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

if command -v rbenv &>/dev/null ; then
  eval "$(rbenv init -)"
fi

if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
  source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

if [ -d /Applications/Postgres.app/Contents/Versions/latest/bin ] ; then
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
fi
