#!/bin/bash
dotfiles=(
  bash_profile
  bashrc
  gitignore_global
  gvimrc
  nethackrc
  vim
  vimrc
)

# copy dat shit
for f in ${dotfiles[@]}; do
  cp -R $f $HOME/.$f
done

# clone the vim plugins
cd $HOME/.vim/bundle/
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/hallison/vim-markdown.git

# git configs
git config --global core.editor vim
git config --global user.name "Adam Dunson"
git config --global core.excludesfile ~/.gitignore_global

echo "Remember to set your git email like so:"
echo
echo "    git config --global user.email \"ich@v0gel.us\""
