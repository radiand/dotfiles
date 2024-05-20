nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fr :RG<CR>

" find word ander cursor
nnoremap <leader>fw :Rg <C-R><C-W><CR>

function! RGPath(fullscreen, path)
    " SYNOPIS: Interactive live grep on file contents in specific directory.

    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, '')
    let reload_command = printf(command_fmt, '{q}' .. ' ' .. a:path)
    let spec = {'options': ['--bind', 'change:reload:' .. reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
