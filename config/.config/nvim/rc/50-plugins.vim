call plug#begin('~/.config/nvim/plugged')

" theme
Plug 'gruvbox-community/gruvbox'

" appearance extensions
Plug 'itchyny/lightline.vim'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

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

call plug#end()
