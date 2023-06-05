function! StatuslineGitBranch()
    let git_branch = system('git branch --show-current')
    if v:shell_error == 0
        return trim(git_branch)
    else
        return ''
    endif
endfunction

function! ShortenedRelativePath()
    let rel_path = expand('%f')
    if empty(rel_path)
        return '[No Name]'
    else
        return pathshorten(rel_path)
    endif
endfunction

function! GetActiveStatusline()
    " left side
    let line = ' %f %h%m%r%w'
    " fill space
    let line .= '%='
    " right side
    let line .= '%y %8(%l,%c%) '
    return line
endfunction

function! GetInactiveStatusline()
    let line = ' %t %h%m%r%w '
    return line
endfunction

set laststatus=2

augroup statusline
    autocmd!
    autocmd WinEnter,BufEnter * setlocal statusline=%!GetActiveStatusline()
    autocmd WinLeave,BufLeave * setlocal statusline=%!GetInactiveStatusline()
augroup end
