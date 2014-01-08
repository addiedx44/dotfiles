#!/bin/bash

paranoid=$([ $1 != "-y" ])

dotfiles=(
  bash_profile
  bashrc
  gemrc
  gitconfig
  gitignore_global
  gvimrc
  logout
  nethackrc
  screenrc
  vim
  vimrc
)
echo "Copying config files..."
for f in ${dotfiles[@]}; do
  if [[ $paranoid && -d $HOME/.$f ]]; then
    read -p "$f directory exists. Remove (y/N)? "
    if [[ "$REPLY" == "Y" || "$REPLY" == "y" ]]; then
      rm -rf $HOME/.$f
      cp -Rv $f $HOME/.$f
    fi
  elif [[ $paranoid && -e $HOME/.$f ]]; then
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
if [ ! -z "$REPLY" ]; then
  git config --global user.name "$REPLY"
fi

read -p "Enter your git user email: "
if [ ! -z "$REPLY" ]; then
  git config --global user.email "$REPLY"
fi

echo
echo "Cloning the Vim plugins..."
vimplugins[0]=nerdtree
vimpluginurls[0]=https://github.com/scrooloose/nerdtree.git
vimplugins[1]=vim-markdown
vimpluginurls[1]=https://github.com/hallison/vim-markdown.git
vimplugins[2]=ack.vim
vimpluginurls[2]=https://github.com/mileszs/ack.vim.git
vimplugins[3]=matchit.zip
vimpluginurls[3]=https://github.com/vim-scripts/matchit.zip.git
vimplugins[4]=vim-lucius
vimpluginurls[4]=https://github.com/jonathanfilip/vim-lucius

for i in {0..4}; do
  if [[ -e $HOME/.vim/bundle/${vimplugins[$i]} ]]; then
    echo "Updating ${vimplugins[$i]}..."
    cd $HOME/.vim/bundle/${vimplugins[$i]}
    git fetch --quiet origin && git reset --quiet --hard origin/HEAD
  else
    echo "Cloning ${vimplugins[$i]}..."
    git clone --quiet ${vimpluginurls[$i]} $HOME/.vim/bundle/${vimplugins[$i]}
  fi
done
