function! GetActiveStatusline()
    " left side
    let line = '%( %m%) %f'
    " fill space
    let line .= '%='
    " right side
    let line .= '%y'
    let line .= '[%{&fileencoding ? &fileencoding : &encoding} %{&fileformat}]'
    let line .= '%{&readonly ? "[read-only]" : ""} '
    let line .= '%8(%l:%c%) '
    return line
endfunction

function! GetInactiveStatusline()
    let line = '%( %m%) %t'
    return line
endfunction

set laststatus=2

augroup statusline
    autocmd!
    autocmd WinEnter,BufEnter * setlocal statusline=%!GetActiveStatusline()
    autocmd WinLeave,BufLeave * setlocal statusline=%!GetInactiveStatusline()
augroup end
