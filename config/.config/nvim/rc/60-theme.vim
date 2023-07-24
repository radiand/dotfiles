set termguicolors
set background=dark

" always show additional column in the gutter to prevent autoresize
set signcolumn=yes

" hide tilde character (end of buffer)
let &fcs='eob: '

if exists('$BASE16_THEME')
      \ && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
    let base16colorspace=256
    colorscheme base16-$BASE16_THEME
endif
