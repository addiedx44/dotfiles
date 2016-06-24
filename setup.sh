#!/bin/bash
paranoid=0
if [ -z "$1" ] || [ "$1" != "-f" ]; then
  paranoid=1
fi

dotfiles=(
  bash_functions
  bash_login
  bash_logout
  bash_profile
  bashrc
  gemrc
  nethackrc
  screenrc
)
echo "Copying config files..."
for f in ${dotfiles[@]}; do
  if [[ $paranoid -eq 1 && -d $HOME/.$f ]]; then
    read -p "$f directory exists. Remove (y/N)? "
    if [[ "$REPLY" == "Y" || "$REPLY" == "y" ]]; then
      rm -rf $HOME/.$f
      cp -Rv $f $HOME/.$f
    fi
  elif [[ $paranoid -eq 1 && -e $HOME/.$f ]]; then
    read -p "$f file exists. Overwrite (y/N)? "
    if [[ "$REPLY" == "Y" || "$REPLY" == "y" ]]; then
      cp -Rv $f $HOME/.$f
    fi
  else
    cp -Rv $f $HOME/.$f
  fi
done

echo
command -v git &>/dev/null && bash "$(dirname $0)/setup-git.sh" "$@"

echo
command -v vim &>/dev/null && bash "$(dirname $0)/setup-vim.sh" "$@"

echo
echo 'Done!'
