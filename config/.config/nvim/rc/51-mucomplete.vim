set completeopt=menu,menuone,noselect

" enables auto popup, without using <Tab>
" NOTE: with completeopt+=longest it will cause auto inserting the text
let g:mucomplete#enable_auto_at_startup = 1

let g:mucomplete#chains = {}
let g:mucomplete#chains.default  = ['path', 'dict', 'omni']
let g:mucomplete#chains.markdown  = ['keyn', 'dict', 'uspl']
