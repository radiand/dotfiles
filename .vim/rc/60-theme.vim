if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set t_Co=256

set signcolumn=yes

set background=dark
set cursorline
"highlight ColorColumn ctermbg=234

set fillchars+=vert:\|

let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_sign_column = 'bg0'

colorscheme gruvbox
