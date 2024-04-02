#!/bin/bash

paranoid=0
if [ -z "$1" ] || [ "$1" != "-f" ]; then
    paranoid=1
fi

function paranoid_cp {
    if [[ "$paranoid" -eq 1 ]]; then
        cp -i "$@"
    else
        cp "$@"
    fi
}

final_messages=""
function append_message {
  if [ -n "$1" ]; then
    final_messages+="$1"$'\n'
  fi
}


# homebrew
if ! command -v brew ; then
    echo 'Installing homebrew...'
    xcode-select --install
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
xargs brew install < "$(dirname "$0")/brew.txt"


# terraform
curl -s https://www.hashicorp.com/.well-known/pgp-key.txt | gpg --import

append_message "Run the following to sign this key once your gpg keys are generated/imported:

gpg --lsign-key security@hashicorp.com
gpg --update-trustdb"

paranoid_cp -r "$(dirname "$0")/terraformrc" "$HOME/.terraformrc"

append_message "Use tfenv to install Terraform, e.g.,

tfenv install"

# vimrc
if ! [ -d "$HOME/.vim_runtime" ] ; then
    git clone --depth=1 https://github.com/amix/vimrc.git "$HOME/.vim_runtime"
fi
sh "$HOME/.vim_runtime/install_awesome_vimrc.sh"
paranoid_cp "$(dirname "$0")/my_configs.vim" "$HOME/.vim_runtime/my_configs.vim"


# vimrc plugins
plugins=(
    vim-python/python-syntax
    hashivim/vim-terraform
)

for plugin in "${plugins[@]}"; do
    plugin_name="${plugin##*/}"

    if ! [ -d "$HOME/.vim_runtime/my_plugins/$plugin_name" ] ; then
        git clone "https://github.com/$plugin.git" "$HOME/.vim_runtime/my_plugins/$plugin_name"
    fi
done


# git
paranoid_cp "$(dirname "$0")/gitconfig" "$HOME/.gitconfig"
paranoid_cp "$(dirname "$0")/gitignore_global" "$HOME/.gitignore_global"


# oh-my-zsh
if ! [ -d "$HOME/.oh-my-zsh" ]; then
    echo 'Installing oh-my-zsh...'
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
paranoid_cp -r "$(dirname "$0")"/zsh_custom/*.zsh "$HOME/.oh-my-zsh/custom"
paranoid_cp -r "$(dirname "$0")/zshrc" "$HOME/.zshrc"
paranoid_cp -r "$(dirname "$0")/zprofile" "$HOME/.zprofile"

# p10k
if ! [ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ] ; then
    echo 'Installing p10k...'
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
fi
paranoid_cp "$(dirname "$0")/p10k.zsh" "$HOME/.p10k.zsh"
source "$HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme"
p10k configure


# misc configs
paranoid_cp -r "$(dirname "$0")/shellcheckrc" "$HOME/.shellcheckrc"
paranoid_cp -r "$(dirname "$0")/flake8" "$HOME/.flake8"
paranoid_cp -r "$(dirname "$0")/gemrc" "$HOME/.gemrc"

echo "$final_messages"
