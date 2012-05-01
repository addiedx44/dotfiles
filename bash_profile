if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

# mac's ls has a different syntax
if [ `uname -s` = 'Darwin' ]; then
  alias ls='ls -G'
else
  alias ls='ls --color'
fi

alias visudo='sudo -E visudo'

export EDITOR=$(which vim)
export PATH="$PATH:$HOME/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
