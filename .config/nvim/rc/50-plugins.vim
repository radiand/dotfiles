call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'ellisonleao/gruvbox.nvim'
Plug 'ggandor/leap.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-mucomplete'
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

if executable('node')
    Plug 'github/copilot.vim'
endif

call plug#end()
