" lineno
set number

" when matching parentheses, briefly jump to match
set showmatch

" indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

" minimal number of screen lines to keep above and below the cursor
set scrolloff=4

" search for tags file up to /
set tags=tags;/
set wildignore+=tags,tags.temp

" disable highlighting search by default, but it can be toggled with :set hlsearch!
set nohlsearch

" shell-like tab completion of commands
set wildmenu
set wildmode=longest:full,full

" yank to xclip
set clipboard=unnamedplus

" paste won't replace yanked text
xnoremap p pgvy

" make working with :find a little bit convenient
set path=.,**

" disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" disable printing pressed keys in command line
set noshowcmd
