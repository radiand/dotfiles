function! Black()
   let save_pos = getpos(".")
   execute ':%!black -q -l 100 - 2>/dev/null'
   call setpos(".", save_pos)
endfunction
command! -nargs=0 Black call Black()

command Mypy :cexpr system("tox run --skip-pkg-install -q -e mypy")
command GetBufferPath let @+ = expand('%:p')

" Put ISO-8601 timestamp at cursor.
command Timestamp :execute "normal! i" . trim(system('date --iso=seconds')) . "\<Esc>"
