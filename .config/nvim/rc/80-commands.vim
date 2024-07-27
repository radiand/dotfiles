command Mypy :cexpr system("tox run --skip-pkg-install -q -e mypy")
command GetBufferPath let @+ = expand('%:p')
