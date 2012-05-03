echo
if [[ `/usr/bin/id -u` -ne 0 ]]; then
  echo "Try sudo ./fortunepony-motd.sh"
else
  echo "Configuring ponysay motd :D"
  if [[ ! `command -v ponysay` ]]; then
    echo "Ponysay is not installed. Try this:"
    echo
    echo "cd $HOME"
    echo "git clone https://github.com/erkin/ponysay.git"
    echo "cd ponysay"
    echo "sudo make"
    echo
  else
    read -r -d '' fortunepony <<'EOF'
#!/bin/bash
echo
fortune|ponysay
EOF

    if [[ `command -v cowsay >/dev/null 2>&1` && `command -v ponysay >/dev/null 2>&1` ]]; then
      [[ `command -v cowsay` -ne "/usr/bin/cowsay" ]] || ln -s `which cowsay` /usr/bin/cowsay
      [[ `command -v fortune` -ne "/usr/bin/fortune" ]] || ln -s `which fortune` /usr/bin/fortune

      echo "$fortunepony" | sudo tee /etc/update-motd.d/51-fortune-pony >/dev/null 2>&1 &
      if [[ -f /etc/update-motd.d/51-fortune-pony ]]; then
        sudo chmod 755 /etc/update-motd.d/51-fortune-pony
      fi
    else
      `command -v cowsay >/dev/null 2>&1` || echo "Cowsay is not installed. Try this: sudo apt-get install cowsay"
      `command -v fortune >/dev/null 2>&1` || echo "Fortune is not installed. Try this: sudo apt-get install fortune"
      echo "There was a problem configuring ponysay motd."
      echo
    fi
  fi
fi
