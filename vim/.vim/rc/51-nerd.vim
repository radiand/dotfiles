" open if no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" switch focus to buffer
autocmd VimEnter * wincmd p

" nerd sidebar will be x columns wide
let g:NERDTreeWinSize=40

" change color for filetypes
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" ignores
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.orig$']
