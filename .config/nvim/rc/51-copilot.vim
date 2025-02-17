let g:copilot_filetypes = {
    \ '*': v:false,
    \ 'bash': v:true,
    \ 'html': v:true,
    \ 'markdown': v:false,
    \ 'python': v:true,
    \ 'vim': v:true,
    \ }

imap <silent><script><expr> <M-CR> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
