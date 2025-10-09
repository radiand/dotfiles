function! Black()
   let save_pos = getpos(".")
   execute ':%!black -q -l 100 - 2>/dev/null'
   call setpos(".", save_pos)
endfunction
command! -nargs=0 Black call Black()

command Mypy :cexpr system("tox run --skip-pkg-install -q -e mypy")
command GetBufferPath let @+ = expand('%:p')

" Put date like: 2024-06-12T14:23:45+00:00
command DateIso :execute "normal! i" . trim(system('date --iso=seconds')) . "\<Esc>"

" Put date like: Wed, 12 Jun 2024 14:23:45 +0000
command DateRfc :execute "normal! i" . trim(system('date --rfc-email ')) . "\<Esc>"

" Put date and then separator for journal entry.
command Jrnl execute "DateRfc" | normal! o-<Esc>0vy79po<Esc>

" Open QuickList window with Markdown headings.
command MdToc :vimgrep /^#/ % | copen
