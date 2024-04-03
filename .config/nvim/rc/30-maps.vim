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

" poor man's wiki
nnoremap <leader>ww :e $HOME/vault/index.md<CR>

" open link under cursor; gx would do that if netrw was enabled
nnoremap <silent>gl :silent !xdg-open <c-r><c-a><CR>

" exit terminal mode with Esc
tnoremap <esc> <C-\><C-N>
