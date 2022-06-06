let mapleader=','

nnoremap ; :
vnoremap ; :

" allow repeat from visual mode
vnoremap . <C-c>.

" use ctrl+s for saving in all modes
noremap <C-s> :write<CR><Esc>
vnoremap <C-s> <Esc>:write<CR><Esc>
inoremap <C-s> <Esc>:write<CR><Esc>

" cycle buffers
nnoremap <F2> :bprevious<CR>
inoremap <F2> <Esc>:bprevious<CR>
nnoremap <F3> :bnext<CR>
inoremap <F3> <Esc>:bnext<CR>
nmap <F12> :b#<bar>bd#<CR>
"nnoremap <F12> :Bclose<CR>

map <F4> <Esc>:ToggleBufExplorer<CR>
map <F5> <Esc>:NERDTreeToggle<CR>
map <F6> <Esc>:TagbarToggle<CR>
let g:lt_quickfix_list_toggle_map = '<F7>'
nnoremap <F8> :set hlsearch!<CR>

nnoremap <leader>r <Esc>:Rg -g!test* -g!static <C-R><C-W><CR>
nnoremap <leader>R <Esc>:Rg -g!test* -g!static 
nnoremap <leader>t :Files<CR>

" move selected line UP/DOWN
nnoremap ,<Up>   :<C-u>silent! move-2<CR>==
nnoremap ,<Down> :<C-u>silent! move+<CR>==
xnoremap ,<Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap ,<Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv
