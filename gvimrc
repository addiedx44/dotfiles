colorscheme macvim " I actually really like this one for gvim :P
set background=dark

if has("win32")
  set guifont=Consolas:h11:cANSI
  au GUIEnter * simalt ~x
else
  if has("mac")
    set guifont=monaco:h13
  endif

  set lines=999
  set columns=999
endif

set guioptions-=T
set guioptions-=t
set guioptions-=m
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=b
