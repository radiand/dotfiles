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
map <F4> <Esc>:Buffers<CR>
nmap <F12> :b#<bar>bd#<CR>

map <F5> <Esc>:NERDTreeToggle<CR>
nnoremap <F8> :set hlsearch!<CR>

nnoremap <leader>t :Files<CR>
