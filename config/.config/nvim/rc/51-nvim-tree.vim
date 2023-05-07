" open if no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NvimTreeOpen | endif

" switch focus to buffer
autocmd VimEnter * wincmd p
