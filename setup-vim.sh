#!/bin/bash
paranoid=0
if [ -z "$1" ] || [ "$1" != "-f" ]; then
  paranoid=1
fi

if command -v brew &>/dev/null ; then
  packages=(
    git
    python3
  )

  for cmd in ${dotfiles[@]}; do
    command -v $cmd &>/dev/null || brew install $cmd
  done
fi

pushd "$(dirname $0)" &>/dev/null

runtimepath="$HOME/.vim_runtime"

if [[ $paranoid -eq 1 && -e "$runtimepath" ]] ; then
  read -p "$runtimepath exists. Remove (y/N)? "
  if [[ "$REPLY" == "Y" || "$REPLY" == "y" ]]; then
    rm -rf "$runtimepath"
  fi
fi
rm -rf "$runtimepath"

git clone git@github.com:adamdunson/vimrc "$runtimepath"
pushd "$runtimepath" &>/dev/null
python3 update_plugins.py
sh install_awesome_vimrc.sh
popd &>/dev/null

cp my_configs.vim "$runtimepath"

popd &>/dev/null
