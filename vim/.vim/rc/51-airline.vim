" tabline
set showtabline=2
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#scrollbar#enabled = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 0
let g:airline_symbols.branch = '⎇ '

" sections
let g:airline_section_z = '%3c %l/%L'
