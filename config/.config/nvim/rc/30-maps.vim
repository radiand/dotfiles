let mapleader=','

nnoremap ; :
vnoremap ; :

" allow repeat from visual mode
vnoremap . <C-c>.

" use ctrl+s for saving in all modes
noremap <C-s> :write<CR><Esc>
vnoremap <C-s> <Esc>:write<CR><Esc>
inoremap <C-s> <Esc>:write<CR><Esc>

" list opened buffers and await typing number to switch buffer
nnoremap <leader>b :ls<CR>:b<Space>
" switch current buffer to alternate and delete the alternate
nnoremap <leader>db :bp\|bd #<CR>

noremap <F5> <Esc>:NvimTreeToggle<CR>

" toggle quickfix window
nnoremap <expr> <leader>q empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'

" poor man's wiki (with vim-markdown instead of vimwiki)
nnoremap <leader>ww :e $HOME/wiki/index.md<CR>
