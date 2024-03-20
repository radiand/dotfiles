set shell=/bin/bash

" store swap (.swp) files in one place
silent !mkdir $HOME/.config/nvim/tmp/ > /dev/null 2>&1
set directory^=$HOME/.config/nvim/tmp//

" store persistent undo files in one place
set undofile
silent !mkdir $HOME/.config/nvim/undo/ > /dev/null 2>&1
set undodir=~/.config/nvim/undo//

" lineno
set number

" when matching parentheses, briefly jump to match
set showmatch

" ignore case when the pattern contains lowercase letters only
set ignorecase
set smartcase

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
set wildignore+=tags,tags.temp,compile_commands.json

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
