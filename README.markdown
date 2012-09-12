Installation or whatever
========================
This isn't 100% yet, and I think I'm using .bashrc and .bash_profile wrong, but you can try this:

    ./linux-setup.sh

It will prompt you before it tries to overwrite any existing files (not including the .vim/ directory; if you want that updated, you should just `rm -rf $HOME/.vim` first or something).