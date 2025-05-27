set completeopt=menu,menuone,noselect

" enables auto popup, without using <Tab>
" NOTE: with completeopt+=longest it will cause auto inserting the text
let g:mucomplete#enable_auto_at_startup = 1

let g:mucomplete#chains = {}
let g:mucomplete#chains.default  = ['path', 'dict', 'omni']
let g:mucomplete#chains.markdown  = ['path', 'keyn', 'dict', 'uspl']

" nvim 0.11+ maps Tab in its defaults, so MUcomplete decided to leave it
" empty. https://github.com/lifepillar/vim-mucomplete/pull/215
imap <Tab> <plug>(MUcompleteFwd)
imap <S-Tab> <plug>(MUcompleteBwd)
