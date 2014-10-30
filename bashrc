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

  # set a fancy prompt (non-color, unless we know we want color)
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
    PS1_START='\e[1;30m\u@\H\e[0m:\e[0;36m\w\e[0m'
  else
    PS1_START='\u@\H:\w'
  fi

  # enable programmable completion features
  if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
  fi
  unset color_prompt force_color_prompt

  if [ "$EUID" -ne 0 ] ; then
    PS1_END="\n"'\D{%H:%M:%S} $ '
    export PS1="${PS1_START}${PS1_END}"
  else
    PS1_END="\n"'\D{%H:%M:%S} # '
    export PS1="${PS1_START}${PS1_END}"
  fi

  if command -v brew &>/dev/null && [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_START="$PS1_START"
    GIT_PROMPT_END="$PS1_END"

    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
  fi

  # enable color support of ls and also add handy aliases
  if command -v dircolors &>/dev/null ; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias less='less -R'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
  fi

  # additional alias definitions
  if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
  fi

  # ctrl+s should search forward in bash history
  stty stop undef

  # force prompt to appear at the bottom of window
  echo -e "\033[$LINES;0f"
fi
