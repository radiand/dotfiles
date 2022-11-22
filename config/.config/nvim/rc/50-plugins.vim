call plug#begin('~/.config/nvim/plugged')

" theme
Plug 'gruvbox-community/gruvbox'

" appearance extensions
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git support
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" lsp
Plug 'neovim/nvim-lspconfig'

" lsp completion
Plug 'lifepillar/vim-mucomplete'

" code completion and jumping
Plug 'ludovicchabant/vim-gutentags'

" linters
Plug 'dense-analysis/ale'
Plug 'ntpeters/vim-better-whitespace'

" language support
Plug 'sheerun/vim-polyglot'

Plug 'google/vim-searchindex'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()
