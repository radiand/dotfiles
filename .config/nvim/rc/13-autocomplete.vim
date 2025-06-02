set completeopt=menuone,noinsert,noselect,popup

" Cycle through completion menu with Tab and Shift-Tab
imap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-TAB>"
