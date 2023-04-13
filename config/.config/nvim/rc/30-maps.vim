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

" list opened buffers and await typing number
nnoremap gb :ls<CR>:b<Space>

noremap <F5> <Esc>:NERDTreeToggle<CR>

noremap <leader>t :Files<CR>
