#!/bin/bash

if ! which brew &>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew install python
pip install --upgrade pip
pip install autopep8 pep8 mccabe frosted flake8 virtualenv virtualenvwrapper
