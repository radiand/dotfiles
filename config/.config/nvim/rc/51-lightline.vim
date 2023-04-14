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
\    'inactive': {
\      'left': [
\        [ 'filename', 'modified' ]
\      ],
\       'right': []
\    },
\    'component': {
\      'linecount': "%{line('$')}",
\     },
\    'component_function': {
\      'gitbranch': 'FugitiveHead'
\    },
\  }
