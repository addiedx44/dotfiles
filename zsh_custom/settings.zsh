path=("$HOME/.bin" $path)

unsetopt AUTO_CD
export PROMPT_EOL_MARK=""

autoload -U select-word-style
select-word-style shell

if alias run-help &>/dev/null ; then
  unalias run-help
fi

autoload run-help
HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
alias help=run-help
