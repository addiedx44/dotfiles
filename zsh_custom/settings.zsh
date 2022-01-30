path=("$HOME/.bin" $path)

unsetopt AUTO_CD
export PROMPT_EOL_MARK=""

autoload -U select-word-style
select-word-style shell
