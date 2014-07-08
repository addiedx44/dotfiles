#!/bin/bash
paranoid=0
if [ -z "$1" ] || [ "$1" != "-y" ]; then
  paranoid=1
fi

dotfiles=(
  gitconfig
  gitignore_global
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
echo "Configuring git..."
git config --global core.excludesfile ~/.gitignore_global

read -p "Enter your git user name: "
if [ -n "$REPLY" ]; then
  git config --global user.name "$REPLY"
fi

read -p "Enter your git user email: "
if [ -n "$REPLY" ]; then
  git config --global user.email "$REPLY"
fi
