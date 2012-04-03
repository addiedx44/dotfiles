#!/bin/bash
if [ command -v vim ]; then
  cp ./.vimrc $HOME/
	cp -R ./.vim $HOME/ 
fi

# if you have git installed, set up some defaults
if [ command -v git ]; then
  git config --global core.editor vim
  git config --global user.name "Adam Dunson"
  git config --global user.email "ich@v0gel.us"
  cp ./.gitignore_global $HOME/
  git config --global core.excludesfile ~/.gitignore_global
fi
