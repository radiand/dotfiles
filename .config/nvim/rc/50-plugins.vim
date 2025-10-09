call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mechatroner/rainbow_csv'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'radiand/zettelkasten'
Plug 'sheerun/vim-polyglot'
Plug 'stevearc/conform.nvim'
Plug 'stevearc/oil.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'zenbones-theme/zenbones.nvim'

if executable('node')
    Plug 'github/copilot.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'olimorris/codecompanion.nvim'
endif

call plug#end()
