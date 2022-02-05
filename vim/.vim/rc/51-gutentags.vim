let g:gutentags_ctags_extra_args = ['--fields=+l']
let g:gutentags_file_list_command = {
    \ 'markers': {
        \ '.git': 'git ls-files',
        \ '.hg': 'hg files',
        \ },
    \ }
