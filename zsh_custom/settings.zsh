path=("$HOME/.bin" $path)

unsetopt AUTO_CD
export PROMPT_EOL_MARK=""

autoload -U select-word-style
select-word-style shell

unalias run-help
autoload run-help
HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
alias help=run-help
