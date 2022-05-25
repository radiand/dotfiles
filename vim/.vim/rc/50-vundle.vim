call plug#begin('~/.vim/plugged')

" theme
Plug 'gruvbox-community/gruvbox'

" appearance extensions
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git support
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" code completion and jumping
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'ludovicchabant/vim-gutentags'

" linters
Plug 'dense-analysis/ale'

" language support
Plug 'fisadev/vim-isort'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'Valloric/matchtagalways'
Plug 'godlygeek/tabular'
Plug 'google/vim-searchindex'
Plug 'jlanzarotta/bufexplorer'
Plug 'nelstrom/vim-visual-star-search'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'zef/vim-cycle'

" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()
