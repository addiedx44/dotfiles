" File: $HOME/.vimrc
" Author: Adam Dunson <adam@cloudspace.com>
"------------------------------------------------------------------------------

" Load plugins
" URL: https://github.com/tpope/vim-pathogen
call pathogen#infect()

set ttyscroll=0         " Turn off scrolling (this is faster).
set ttyfast             " We have a fast terminal connection.
set noerrorbells        " No beeps.
set visualbell
set t_vb=

set nocompatible        " Disable vi compatibility.
set nobackup            " Do not keep a backup file.
"set autowrite          " Automatically save before :next, :make etc.
set history=255         " Number of lines of command line history.
set undolevels=255      " Number of undo levels.
set autochdir           " Auto cwd to current file.
set viminfo='20,\"50    " Read/write a .viminfo file, don't store more than
                        " 50 lines of registers.

" Path/file expansion
set wildmenu
set wildmode=list:longest,full
set wildchar=<TAB>

colorscheme lucius
LuciusBlackHighContrast
set cursorline          " highlight current line
set number              " line numbers
set ruler               " Show the line and column numbers of the cursor.
set modeline            " Enable modeline.
set showmode            " Show current mode.
set laststatus=2        " When to show a statusline.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.

set ignorecase          " Case insensitive matching.
set incsearch           " Incremental search.
set nohlsearch          " Don't highlight search matches.
set magic               " Use 'magic' patterns (extended regular expressions).

set encoding=utf-8      " Set default encoding to UTF-8.
set textwidth=0         " Don't wrap words by default.
set linebreak           " Don't break in the middle of words.
"set showbreak=+        " Show a '+' if a line is longer than the screen.
"set fo-=t

set autoindent
set cindent
"set smartindent

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set scrolloff=5         " Keep a context when scrolling.
set nostartofline       " Do not jump to first character with page commands,
                        " i.e., keep the cursor in the current column.

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
set esckeys             " Cursor keys in insert mode.

" tell vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines
set listchars=tab:▸·,trail:·
"set list

" Enable syntax-highlighting.
if has("syntax")
  syntax on
endif


" Function keys.
"------------------------------------------------------------------------------
" F1: Toggle NERDTree.
nmap <silent> <F1> :NERDTreeToggle<CR>
imap <silent> <F1> <ESC>:NERDTreeToggle<CR>

" F2: Toggle wrap/linebreak.
nmap <silent> <F2> :set wrap!<CR>:set linebreak!<CR>
imap <silent> <F2> <ESC>:set wrap!<CR>:set linebreak!<CR>a

" F3: Toggle search highlighting.
nmap <silent> <F3> :set hlsearch!<CR>
imap <silent> <F3> <ESC>:set hlsearch!<CR>a

" F4: Toggle list.
nmap <silent> <F4> :set list!<CR>
imap <silent> <F4> <ESC>:set list!<CR>a


" Autocorrect
"------------------------------------------------------------------------------
"iab beacuse because
nmap :W :w
nmap :Q :q


" File-type specific settings.
"------------------------------------------------------------------------------
if has("autocmd")
  " Enable file type detection and file-type specific plugins.
  filetype plugin indent on

  autocmd BufReadPre,FileReadPre *.py set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  autocmd BufReadPre,FileReadPre *.c,*.cpp,*.h set expandtab
  "autocmd BufReadPre,FileReadPre *.java let java_allow_cpp_keywords=1
  autocmd BufNewFile,BufRead *.text,*.md,*.markdown set filetype=markdown
  autocmd BufNewFile,BufRead *.conf set expandtab
endif
