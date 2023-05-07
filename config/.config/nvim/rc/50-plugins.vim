call plug#begin('~/.config/nvim/plugged')

" theme
Plug 'gruvbox-community/gruvbox'

" appearance extensions
Plug 'itchyny/lightline.vim'

" git support
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" lsp
Plug 'neovim/nvim-lspconfig'

" lsp completion
Plug 'lifepillar/vim-mucomplete'

" linters
Plug 'ntpeters/vim-better-whitespace'

" language support
Plug 'sheerun/vim-polyglot'

Plug 'nvim-tree/nvim-tree.lua'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()
