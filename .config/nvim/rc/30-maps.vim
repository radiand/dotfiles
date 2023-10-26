map <space> <leader>

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

" poor man's wiki (with vim-markdown instead of vimwiki)
nnoremap <leader>ww :e $HOME/wiki/index.md<CR>

" open link under cursor; gx would do that if netrw was enabled
nnoremap <silent>gl :silent !xdg-open <c-r><c-a><CR>

nnoremap <leader>g :vert Git<CR>
