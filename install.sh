#!/bin/zsh

if [ "$(uname)" == 'Darwin' ] ; then
    zsh "$(dirname "$0")/install-macos.sh" $@
fi
