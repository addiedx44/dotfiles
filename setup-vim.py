#!/usr/bin/python
import errno
import os
import shutil
import signal
import sys


def signal_handler(signal, frame):
    print('')
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

try: input = raw_input
except NameError: pass

PLUGINPATH = os.getenv('HOME') + '/.vim/bundle'

paranoid = 0
if '-f' not in sys.argv:
    paranoid = 1

dotfiles = [
    'gvimrc',
    'vim',
    'vimrc'
]
print('Configuring vim...')
for dotfile in dotfiles:
    src = os.path.dirname(os.path.abspath(__file__)) + '/' + dotfile
    dst = os.getenv('HOME') + '/.' + dotfile
    if paranoid == 1:
        if input(dotfile + ' exists. Remove (y/N)?') == 'y':
            shutil.rmtree(dst, ignore_errors=True)
            try:
                shutil.copytree(src, dst)
            except OSError as exc:
                if exc.errno in [errno.ENOTDIR, errno.ENOENT]:
                    if exc.errno == errno.ENOTDIR:
                        try: os.unlink(dst)
                        except OSError: pass
                    shutil.copy(src, dst)
                else: raise
    else:
        shutil.rmtree(dst, ignore_errors=True)
        try:
            shutil.copytree(src, dst)
        except OSError as exc:
            if exc.errno in [errno.ENOTDIR, errno.ENOENT]:
                if exc.errno == errno.ENOTDIR:
                    try: os.unlink(dst)
                    except OSError: pass
                shutil.copy(src, dst)
            else: raise

os.system('git clone --quiet https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim')
os.system('vim +PluginInstall +qall')
