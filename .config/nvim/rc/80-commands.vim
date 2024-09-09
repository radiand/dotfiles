command Mypy :cexpr system("tox run --skip-pkg-install -q -e mypy")
command GetBufferPath let @+ = expand('%:p')

" Put ISO-8601 timestamp at cursor.
command Timestamp :execute "normal! i" . trim(system('date --iso=seconds')) . "\<Esc>"
