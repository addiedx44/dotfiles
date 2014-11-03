" File: $HOME/.vimrc
" Author: Adam Dunson <adam@cloudspace.com>
"------------------------------------------------------------------------------

" Load plugins
" URL: https://github.com/tpope/vim-pathogen
call pathogen#infect()

colorscheme lucius
LuciusBlackHighContrast

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
