# If not running interactively, don't do anything
if [ -n "$PS1" ]; then
  # don't put duplicate lines in the history or force ignoredups and
  # ignorespace
  HISTCONTROL=ignoredups:ignorespace

  # append to the history file, don't overwrite it
  shopt -s histappend

  # set history length
  HISTSIZE=1024
  HISTFILESIZE=2048

  # check the window size after each command and, if necessary, update the
  # values of LINES and COLUMNS
  shopt -s checkwinsize

  # make less more friendly for non-text input files
  [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

  # set variable identifying the chroot you work in (used in the prompt below)
  if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot="$(cat /etc/debian_chroot)"
  fi

  # set a fancy prompt (non-color, unless we know we "want" color)
  case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
  esac

  if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
      color_prompt=yes
    else
      color_prompt=
    fi
  fi

  if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]'
  else
    PS1='${debian_chroot:+($debian_chroot)}\u@\H:\w'
  fi

  # enable programmable completion features
  if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion

    export GIT_PS1_SHOWDIRTYSTATE=1

    if [ "$color_prompt" = yes ]; then
      PS1="$PS1"'\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\]\[\033[00m\]'
    else
      PS1="$PS1"'$(__git_ps1)'
    fi
  fi
  unset color_prompt force_color_prompt
  export PS1="$PS1\n\$ "

  # enable color support of ls and also add handy aliases
  if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
  fi

  # Alias definitions
  if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
  fi

  # ctrl+s should search forward in bash history
  stty stop undef

  PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi
