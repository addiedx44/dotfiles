set number
set tabstop=2 shiftwidth=2
set nohlsearch
set gfn=Source\ Code\ Pro:h13,Hack:h13,Menlo:h13
set listchars=tab:▸·,trail:·
set list

set textwidth=99
set colorcolumn=+1

let g:NERDTreeWinPos = "left"
let g:syntastic_quiet_messages={'level':'warnings'}

map 0 0
map + +
map _ _
map <Space> <Space>
map <C-Space> <C-Space>
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

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

command! ShouldRun execute "normal! $?should.*do\<cr>/'\<cr>lv/do\<cr>?'\<cr>h".'"ty'|execute "!ruby % -n '/".@t."/'"|let @t=""
