syntax on

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

" during search, jump to matches while typing
set incsearch
set ignorecase
set smartcase

" indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set scrolloff=4

set autoindent
set smartindent
set backspace=indent,eol,start

" show current mode
set showmode
set showcmd

" enable mouse
set mouse=a

" search for tags file up to /
set tags=tags;/
set wildignore+=tags,tags.temp,compile_commands.json

" disable highlighting search by default, but it can be toggled with :set hlsearch!
set nohlsearch
