if has("win32")
  set guifont=Consolas:h11:cANSI
  "au GUIEnter * simalt ~x " 
else
  if has("mac")
    set guifont=monaco:h13
  endif
endif

set noeb vb t_vb= " stfu

set guioptions-=T " hide toolbar
set guioptions-=t " hide tearoff menu items
set guioptions-=m " hide menu bar
set guioptions-=l " hide left-hand scrollbar
set guioptions-=L " hide left-hand scrollbar for vertically split window
set guioptions-=r " hide right-hand scrollbar
set guioptions-=R " hide right-hand scrollbar for vertically split window
set guioptions-=b " hide bottom (horizontal) scrollbar
