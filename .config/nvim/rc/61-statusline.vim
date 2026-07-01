function! GetActiveStatusline()
    " left side
    let line = '%( %m%) %t'
    " fill space
    let line .= '%='
    " right side
    let line .= '%y'
    let line .= '[%{&fileencoding ? &fileencoding : &encoding} %{&fileformat}]'
    let line .= '%{&readonly ? "[read-only]" : ""} '
    let line .= '%8(%l,%c%) %4(%P%) '
    return line
endfunction

function! GetInactiveStatusline()
    let line = '%( %m%) %t'
    return line
endfunction

augroup statusline
    autocmd!
    autocmd WinEnter,BufEnter * setlocal statusline=%!GetActiveStatusline()
    autocmd WinLeave,BufLeave * setlocal statusline=%!GetInactiveStatusline()
augroup end
