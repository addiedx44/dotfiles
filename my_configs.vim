set noeb vb t_vb= " stfu
set tabstop=2
set shiftwidth=2
set nojoinspaces " one space after a period
set showcmd
set number
set listchars=tab:▸·,trail:·
set list
set nohlsearch
set gfn=Source\ Code\ Pro\ ExtraLight:h13,Hack:h13,Menlo:h13
set fo-=t
set colorcolumn=+1

autocmd FileType python setlocal colorcolumn=80
au BufRead,BufNewFile *.template set ft=yaml

map 0 0
map + +
map _ _
map <Space> <Space>
map <C-Space> <C-Space>
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)
nmap :W :w
nmap :Q :q
unmap $$
unmap $1
unmap $2
unmap $3
unmap $e
unmap $q

" F1: toggle NERDTree
nmap <silent> <F1> :NERDTreeToggle<CR>
imap <silent> <F1> <ESC>:NERDTreeToggle<CR>

" F2: toggle wrap/linebreak
nmap <silent> <F2> :set wrap!<CR>:set linebreak!<CR>:set wrap?<CR>
imap <silent> <F2> <ESC>:set wrap!<CR>:set linebreak!<CR>:set wrap?<CR>a

" F3: toggle search highlighting
nmap <silent> <F3> :set hlsearch!<CR>:set hlsearch?<CR>
imap <silent> <F3> <ESC>:set hlsearch!<CR>:set hlsearch?<CR>a

" F10: clear trailing whitespace
nmap <silent> <F10> :call CleanExtraSpaces()<CR>:echo "Trailing whitespace deleted!"<CR>
imap <silent> <F10> <ESC>:call CleanExtraSpaces()<CR>:echo "Trailing whitespace deleted!"<CR>a
