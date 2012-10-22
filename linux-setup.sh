#!/bin/bash

dotfiles=(
  bash_profile
  bashrc
  gitconfig
  gitignore_global
  gvimrc
  nethackrc
  vim
  vimrc
)
echo "Copying config files..."
for f in ${dotfiles[@]}; do
  if [[ -d $HOME/.$f ]]; then
    echo "$f already exists. Skipping $f..."
  else
    cp -Riv $f $HOME/.$f
  fi
done


echo
echo "Cloning the Vim plugins..."
vimplugins[0]=nerdtree
vimpluginurls[0]=https://github.com/scrooloose/nerdtree.git
vimplugins[1]=vim-markdown
vimpluginurls[1]=https://github.com/hallison/vim-markdown.git
vimplugins[2]=ack.vim
vimpluginurls[2]=https://github.com/mileszs/ack.vim.git

for i in {0..2}; do
  if [[ -e $HOME/.vim/bundle/${vimplugins[$i]} ]]; then
    echo "Updating ${vimplugins[$i]}..."
    cd $HOME/.vim/bundle/${vimplugins[$i]}
    git fetch --quiet origin && git reset --quiet --hard origin/HEAD
  else
    echo "Cloning ${vimplugins[$i]}..."
    git clone --quiet ${vimpluginurls[$i]} $HOME/.vim/bundle/${vimplugins[$i]}
  fi
done


echo
echo "Configuring git..."
git config --global core.editor vim
git config --global core.excludesfile ~/.gitignore_global

echo
echo "Remember to set your git user name and email like so:"
echo
echo "    git config --global user.name \"Adam Dunson\""
echo "    git config --global user.email \"ich@v0gel.us\""
echo
