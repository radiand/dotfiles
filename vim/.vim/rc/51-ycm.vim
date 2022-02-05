set completeopt-=preview

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_show_diagnostics_ui = 0

let g:ycm_python_interpreter_path = '/usr/bin/python3'
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_python_sys_path = [
  \  '$HOME/.local/lib/python3.7/site-packages',
  \  '/usr/lib/python3.7'
  \]
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.global_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/code/*']

" definitions popup (<leader>D toggles it manually)
let g:ycm_auto_hover = ''
nmap <leader>d <plug>(YCMHover)
