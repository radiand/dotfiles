function! Black()
   let save_pos = getpos(".")
   execute ':%!black -q -l 100 - 2>/dev/null'
   call setpos(".", save_pos)
endfunction

function! ISort()
   let save_pos = getpos(".")
   execute ':%!isort - 2>/dev/null'
   call setpos(".", save_pos)
endfunction

command Black :call Black()
command ISort :call ISort()
command Ruff :cexpr system("tox run --skip-pkg-install -qq -e ruff -- -q")
command Mypy :cexpr system("tox run --skip-pkg-install -q -e mypy")
command GetBufferPath let @+ = expand('%:p')
