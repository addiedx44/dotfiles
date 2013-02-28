"------------------------------------------------------------------------------
" File: $HOME/.vimrc
" Author: Adam Dunson <ich@v0gel.us>
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------

" enable pathogen
" URL: https://github.com/tpope/vim-pathogen
call pathogen#infect()

"------------------------------------------------------------------------------
" Standard stuff.
"------------------------------------------------------------------------------

"set paste              " enable pasting code
"set tw=79
set textwidth=0         " Don't wrap words by default.
set linebreak           " Don't break in the middle of words.
"set fo-=t

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
"set autochdir           " Auto cwd to current file.
set viminfo='20,\"50    " Read/write a .viminfo file, don't store more than
                        " 50 lines of registers.

" Path/file expansion in colon-mode.
set wildmode=list:longest
set wildchar=<TAB>

"set background=dark
set number              " line numbers
set cursorline          " highlight current line
set modeline            " Enable modeline.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set laststatus=2        " When to show a statusline.
set ruler               " Show the line and column numbers of the cursor.
set scrolloff=5         " Keep a context when scrolling.

set ignorecase          " Case insensitive matching.
set incsearch           " Incremental search.
set nohlsearch          " Don't highlight search matches.
set magic               " Use 'magic' patterns (extended regular expressions).

set autoindent
set cindent
"set smartindent

set esckeys             " Cursor keys in insert mode.
set tabstop=2           " Number of spaces <tab> counts for.
set shiftwidth=2        " Number of spaces <tab> counts for.
set expandtab         " Don't expand tabs
"set encoding=utf-8     " Set default encoding to UTF-8.
"set showbreak=+        " Show a '+' if a line is longer than the screen.
set nostartofline       " Do not jump to first character with page commands,
                        " i.e., keep the cursor in the current column.

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Tell vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
"set listchars=tab:>-,trail:-<,eol:$


" Enable syntax-highlighting.
if has("syntax")
  syntax on
endif


"------------------------------------------------------------------------------
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


"------------------------------------------------------------------------------
" Correct typos.
"------------------------------------------------------------------------------

"form for typo correction
"iab beacuse    because

" Enable this if you mistype :w as :W or :q as :Q.
nmap :W :w
nmap :Q :q


"------------------------------------------------------------------------------
" Abbreviations.
"------------------------------------------------------------------------------

" My name + email address.
"ab add Adam Dunson <ich@v0gel.us>


"------------------------------------------------------------------------------
" Miscellaneous stuff.
"------------------------------------------------------------------------------

" Spellcheck.
"map V :!ispell -x %<CR>:e!<CR><CR>

" ROT13 decode/encode the selected text (visual mode).
" Alternative: 'unmap g' and then use 'g?'.
"vmap rot :!tr A-Za-z N-ZA-Mn-za-m<CR>

" Make p in visual mode replace the selected text with the "" register.
"vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>


"------------------------------------------------------------------------------
" File-type specific settings.
"------------------------------------------------------------------------------

if has("autocmd")
  " Enabled file type detection and file-type specific plugins.
  filetype plugin indent on
  " filetype plugin on

  " C/C++ code.
  autocmd BufReadPre,FileReadPre *.c,*.cpp,*.h set noexpandtab

  " Java code.
  autocmd BufReadPre,FileReadPre *.java set noexpandtab
  "autocmd BufReadPre,FileReadPre *.java let java_allow_cpp_keywords = 1

  autocmd BufReadPre,FileReadPre *.s set tabstop=16 shiftwidth=16 noexpandtab

  autocmd BufNewFile,BufRead *.text,*.md,*.markdown set filetype=markdown

  autocmd BufNewFile,BufRead *.conf set expandtab
endif
