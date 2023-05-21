set laststatus=2

let g:lightline = {
\    'colorscheme': 'gruvbox',
\    'active': {
\      'left': [
\        [ 'mode', 'paste' ],
\        [ 'readonly', 'shortenedpath', 'modified' ],
\        [ 'gitbranch' ]
\      ],
\      'right': [
\        [ 'lineinfo' ],
\        [ 'fileformat', 'fileencoding', 'filetype']
\       ]
\    },
\    'inactive': {
\      'left': [
\        [ 'filename', 'modified' ]
\      ],
\       'right': []
\    },
\    'component_function': {
\      'gitbranch': 'StatuslineGitBranch',
\      'shortenedpath': 'ShortenedRelativePath'
\    },
\  }

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
        return '[Empty]'
    else
        return pathshorten(rel_path)
    endif
endfunction
