let g:ale_fixers = {
\   'python': ['black'],
\}

let g:ale_linters = {
\   'python': ['flake8', 'isort', 'mypy'],
\}

" stop spamming buffer with warnings
let g:ale_virtualtext_cursor = 'disabled'
