set laststatus=2

let g:lightline = {
\    'colorscheme': 'gruvbox',
\    'active': {
\      'left': [
\        [ 'mode', 'paste' ],
\        [ 'readonly', 'filename', 'modified' ],
\        [ 'gitbranch' ]
\      ]
\    },
\    'component_function': {
\      'gitbranch': 'FugitiveHead'
\    },
\  }
