#!/bin/bash

# install homebrew
if [ "$(uname)" == 'Darwin' ] ; then
    bash "$(dirname "$0")/install-macos.sh" "$@"
fi
