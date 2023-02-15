autocmd FileType markdown setlocal textwidth=80
autocmd FileType python setlocal textwidth=100

" Never automatically break line in insert mode. However, it is still possible
" to do 'gq' motion to break lines according to 'textwidth'.
autocmd BufEnter * set formatoptions+=l
