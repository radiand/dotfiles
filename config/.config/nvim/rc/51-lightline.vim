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
\      'gitbranch': 'FugitiveHead',
\      'shortenedpath': 'ShortenedPath'
\    },
\  }

function! ShortenedPath()
let l:filePath = expand('%')
    if winwidth(0) > 100
        return l:filePath
    else
        return pathshorten(l:filePath)
    endif
endfunction
