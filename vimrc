" File: $HOME/.vimrc
" Author: Adam Dunson <adam@cloudspace.com>
"------------------------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'hallison/vim-markdown'
Plugin 'vim-scripts/matchit.zip'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'tyok/nerdtree-ack'
Plugin 'tyok/ack.vim'
Plugin 'kchmck/vim-coffee-script'
"Plugin 'andviro/flake8-vim'
Plugin 'christoomey/vim-sort-motion'
Plugin 'derekwyatt/vim-scala'
Plugin 'elzr/vim-json'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

try
  colorscheme lucius
  LuciusBlackHighContrast
catch /^Vim\%((\a\+)\)\=:E185/
endtry

set ttyfast
set noeb vb t_vb=       " stfu
set nocompatible
set encoding=utf-8

set history=255         " Number of lines of command line history.
set undolevels=255      " Number of undo levels.
set viminfo='20,\"50    " Read/write a .viminfo file, don't store more than
                        " 50 lines of registers.

" path/file expansion
set wildmenu
set wildmode=list:longest,full
set wildchar=<TAB>

set cursorline          " highlight current line
set number              " line numbers
set ruler               " show the line and column numbers of the cursor
set modeline            " show modeline
set showmode            " show current mode
set laststatus=2        " when to show a statusline
set showcmd             " show (partial) command in status line

set showmatch           " show matching brackets
set ignorecase          " case-insensitive matching
set incsearch           " incremental search
set nohlsearch          " don't highlight search matches
set magic               " use 'magic' patterns (extended regular expressions)
set textwidth=0         " don't wrap words by default
set linebreak           " don't break in the middle of words

set autoindent
set cindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set scrolloff=5         " keep a context when scrolling
set nostartofline       " do not jump to first character with page commands,
                        " i.e., keep the cursor in the current column

set esckeys
set backspace=indent,eol,start

set listchars=tab:▸·,trail:·
set list

" autocorrect
nmap :W :w
nmap :Q :q

" Macros
" F1: toggle NERDTree
nmap <silent> <F1> :NERDTreeToggle<CR>
imap <silent> <F1> <ESC>:NERDTreeToggle<CR>

" F2: toggle wrap/linebreak
nmap <silent> <F2> :set wrap!<CR>:set linebreak!<CR>
imap <silent> <F2> <ESC>:set wrap!<CR>:set linebreak!<CR>a

" F3: toggle search highlighting
nmap <silent> <F3> :set hlsearch!<CR>
imap <silent> <F3> <ESC>:set hlsearch!<CR>a

" F4: toggle list
nmap <silent> <F4> :set list!<CR>
imap <silent> <F4> <ESC>:set list!<CR>a

let mapleader=";"

" window
nmap <leader>swh  :topleft  vnew<CR>
nmap <leader>swl :botright vnew<CR>
nmap <leader>swk    :topleft  new<CR>
nmap <leader>swj  :botright new<CR>

" buffer
nmap <leader>sh   :leftabove  vnew<CR>
nmap <leader>sl  :rightbelow vnew<CR>
nmap <leader>sk     :leftabove  new<CR>
nmap <leader>sj   :rightbelow new<CR>

" enable syntax highlighting
if has("syntax")
  syntax on
endif

if has("autocmd")
  filetype plugin indent on
  autocmd BufReadPre,FileReadPre *.py set shiftwidth=4 tabstop=4 softtabstop=4
  autocmd BufNewFile,BufRead *.text,*.md,*.markdown set filetype=markdown
  autocmd BufNewFile,BufRead *.raml set filetype=yaml
endif
