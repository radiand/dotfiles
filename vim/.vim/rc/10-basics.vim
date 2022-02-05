syntax on

set shell=/bin/bash

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
set ttymouse=sgr

" search for tags file up to /
set tags=tags;/
set wildignore+=tags,tags.temp,compile_commands.json

" store swap (.swp) files in one place
silent !mkdir $HOME/.vim/tmp/ > /dev/null 2>&1
set directory^=$HOME/.vim/tmp//

" store persistent undo files in one place
set undofile
silent !mkdir $HOME/.vim/undo/ > /dev/null 2>&1
set undodir=~/.vim/undo//
