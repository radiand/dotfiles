if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
set cursorline

" always show additional column in the gutter to prevent autoresize
set signcolumn=yes

let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_sign_column = 'bg0'

colorscheme gruvbox
