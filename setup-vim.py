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
print('Copying config files...')
for dotfile in dotfiles:
    src = os.path.dirname(os.path.abspath(__file__)) + '/' + dotfile
    dst = os.getenv('HOME') + '/.' + dotfile
    if paranoid == 1:
        if input(dotfile + ' exists. Remove (y/N)?') == 'y':
            try:
                shutil.rmtree(dst)
                shutil.copytree(src, dst)
            except OSError as exc:
                if exc.errno in [errno.ENOTDIR, errno.ENOENT]:
                    if exc.errno == errno.ENOTDIR:
                        os.unlink(dst)
                    shutil.copy(src, dst)
                else: raise
    else:
        try:
            shutil.rmtree(dst)
            shutil.copytree(src, dst)
        except OSError as exc:
            if exc.errno in [errno.ENOTDIR, errno.ENOENT]:
                if exc.errno == errno.ENOTDIR:
                    os.unlink(dst)
                shutil.copy(src, dst)
            else: raise

plugins = {
    'nerdtree': 'https://github.com/scrooloose/nerdtree.git',
    'vim-markdown': 'https://github.com/hallison/vim-markdown.git',
    'matchit.zip': 'https://github.com/vim-scripts/matchit.zip.git',
    'vim-lucius': 'https://github.com/jonathanfilip/vim-lucius',
    'puppet-syntax-vim': 'https://github.com/puppetlabs/puppet-syntax-vim.git'
}
print('Cloning the Vim plugins...')
for plugin, url in plugins.items():
    if os.path.isdir(PLUGINPATH + '/' + plugin):
        print('Updating ' + plugin)
        cmd = ['cd ' + PLUGINPATH + '/' + plugin]
        cmd.append('git fetch --quiet origin')
        cmd.append('git reset --quiet --hard origin/HEAD')
        os.system(' && '.join(cmd))
    else:
        print('Cloning ' + plugin)
        os.system('git clone --quiet ' + url + ' ' + PLUGINPATH + '/' + plugin)
