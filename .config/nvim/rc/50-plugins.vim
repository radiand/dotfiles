call plug#begin('~/.config/nvim/plugged')

" theme
Plug 'ellisonleao/gruvbox.nvim'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-live-grep-args.nvim'

" git support
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" lsp
Plug 'neovim/nvim-lspconfig'

" lsp completion
Plug 'lifepillar/vim-mucomplete'

" language support
Plug 'mechatroner/rainbow_csv'
Plug 'sheerun/vim-polyglot'

Plug 'stevearc/oil.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

call plug#end()
