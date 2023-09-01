call plug#begin('~/.config/nvim/plugged')

" theme
Plug 'ellisonleao/gruvbox.nvim'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }

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
Plug 'mechatroner/rainbow_csv'
Plug 'sheerun/vim-polyglot'

Plug 'stevearc/oil.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

call plug#end()
