" open if no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" switch focus to buffer
autocmd VimEnter * wincmd p

" nerd sidebar will be x columns wide
let g:NERDTreeWinSize=40

" workaround for never-hiding menu since nvim 0.8.0 (and vim 9.0)
let g:NERDTreeMinimalMenu=1

" change color for filetypes
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" ignores
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.orig$']
