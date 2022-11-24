set completeopt=menu,menuone,noselect

" enables auto popup, without using <Tab>
" NOTE: with completeopt+=longest it will cause auto inserting the text
let g:mucomplete#enable_auto_at_startup = 1

" Shut off completion messages
set shortmess+=c

" Add only if Vim beeps during completion
set belloff+=ctrlg
