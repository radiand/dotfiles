set laststatus=2

let g:lightline = {
\    'colorscheme': 'gruvbox',
\    'active': {
\      'left': [
\        [ 'mode', 'paste' ],
\        [ 'readonly', 'filename', 'modified' ],
\        [ 'gitbranch' ]
\      ],
\      'right': [
\        [ 'lineinfo', 'linecount' ],
\        [ 'fileformat', 'fileencoding', 'filetype']
\       ]
\    },
\    'component': {
\      'linecount': "%{line('$')}",
\     },
\    'component_function': {
\      'gitbranch': 'FugitiveHead'
\    },
\  }
