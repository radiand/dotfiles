let mapleader=','

nnoremap ; :
vnoremap ; :

" allow repeat from visual mode
vnoremap . <C-c>.

" use ctrl+s for saving in all modes
noremap <C-s> :write<CR><Esc>
vnoremap <C-s> <Esc>:write<CR><Esc>
inoremap <C-s> <Esc>:write<CR><Esc>

noremap <C-q> <Esc>:Buffers<CR>
" allow to toggle FZF Buffers with same key motion
autocmd! FileType fzf tnoremap <buffer> <C-q> <c-c>

" list opened buffers and await typing number to switch buffer
nnoremap <leader>b :ls<CR>:b<Space>
" list opened buffers and await typing number to delete buffer
nnoremap <leader>db :ls<CR>:bd<Space>

noremap <F5> <Esc>:NERDTreeToggle<CR>

noremap <leader>t :Files<CR>
