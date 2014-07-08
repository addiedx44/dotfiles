#!/bin/bash
paranoid=0
if [ -z "$1" ] || [ "$1" != "-y" ]; then
  paranoid=1
fi

dotfiles=(
  bash_profile
  bashrc
  gemrc
  bash_logout
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

[ command -v git >/dev/null 2>&1 ] && source "$(dirname $0)/setup-git.sh"
[ command -v vim >/dev/null 2>&1 ] && python "$(dirname $0)/setup-vim.py"
