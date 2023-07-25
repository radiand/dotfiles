au FileType js setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et
au FileType xml setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et

autocmd BufNewFile,BufRead *.tag   set syntax=html
autocmd BufNewFile,BufRead *.jql   set syntax=sql
autocmd BufNewFile,BufRead .bash*   set syntax=bash

autocmd FileType make set noexpandtab tabstop=8 shiftwidth=8 softtabstop=0
