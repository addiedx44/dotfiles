#!/bin/bash
if command -v git >/dev/null 2>&1; then
  git config --global core.editor vim
  git config --global user.name "Adam Dunson"
  git config --global user.email "ich@v0gel.us"
  cp ./.gitignore_global $HOME/
  git config --global core.excludesfile ~/.gitignore_global
fi
