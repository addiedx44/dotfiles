Installation or whatever
========================

    cp ./.gitignore_global $HOME/
    ./git-stuff.sh # for git configs
    cp ./.vimrc $HOME/
    cp -R ./.vim $HOME/

I could probably figure out submodules, but it's really not that important.
After you `cp -R ./.vim $HOME/`, run this for nerdtree:

    cd $HOME/.vim/bundle/ && \
    git clone https://github.com/scrooloose/nerdtree.git && \
    git clone https://github.com/hallison/vim-markdown.git
