" automatically write on buffer change
au FocusLost * :wa
set autowrite

" no error bells
set noerrorbells
set visualbell t_vb=

" highlight whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" shell-like tab completion of commands
set wildmenu
set wildmode=list:longest
