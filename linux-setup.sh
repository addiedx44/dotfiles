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

echo
echo "Copying config files"
for f in ${dotfiles[@]}; do
  cp -Rv $f $HOME/.$f
done

echo
echo "clone the vim plugins"
cd $HOME/.vim/bundle/
git clone https://github.com/scrooloose/nerdtree.git >/dev/null &
git clone https://github.com/hallison/vim-markdown.git >/dev/null &

echo
echo "Configuring ponysay motd :D"
cd $HOME
sudo apt-get update >/dev/null &
sudo apt-get install cowsay fortune >/dev/null &
git clone https://github.com/erkin/ponysay.git >/dev/null &
read -r -d '' fortunepony <<'EOF'
#!/bin/bash
echo
fortune|ponysay
EOF
if [ `command -v cowsay >/dev/null 2>&1` -a `command -v ponysay >/dev/null 2>&1` -a -d $HOME/ponysay ]; then
  ln -s `which cowsay` /usr/bin/cowsay
  ln -s `which fortune` /usr/bin/fortune
  cd $HOME/ponysay
  sudo make install
  echo "$fortunepony" | sudo tee /etc/update-motd.d/51-fortune-pony >/dev/null 2>&1 &
  if [ -f /etc/update-motd.d/51-fortune-pony ]; then
    sudo chmod 755 /etc/update-motd.d/51-fortune-pony
  fi
else
  `command -v cowsay >/dev/null 2>&1` || echo "Command cowsay does not exist."
  `command -v fortune >/dev/null 2>&1` || echo "Command fortune does not exist."
  echo "There was a problem configuring ponysay motd."
fi

echo
echo "git configs"
git config --global core.editor vim
git config --global user.name "Adam Dunson"
git config --global core.excludesfile ~/.gitignore_global

echo
echo "Remember to set your git email like so:"
echo
echo "    git config --global user.email \"ich@v0gel.us\""
echo
