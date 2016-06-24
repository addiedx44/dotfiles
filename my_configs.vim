let g:NERDTreeWinPos = "left"
set number
set tabstop=2 shiftwidth=2

set gfn=Source\ Code\ Pro:h13,Hack:h13,Menlo:h13

try
  colorscheme lucius
  LuciusBlackLowContrast
catch /^Vim\%((\a\+)\)\=:E185/
endtry

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

command ShouldRun execute "normal! /should.*do\<cr>/'\<cr>lv/do\<cr>?'\<cr>h".'"ty'|execute "!ruby % -n '/".@t."/'"|let @t=""
