if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

alias ls='ls -Gp'
alias visudo='sudo -E visudo'

export EDITOR=$(which vim)
export PATH="$PATH:$HOME/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
