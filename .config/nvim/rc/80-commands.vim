function! Black()
   let save_pos = getpos(".")
   execute ':%!black -q -l 100 - 2>/dev/null'
   call setpos(".", save_pos)
endfunction
command! -nargs=0 Black call Black()

function! s:Locate(line1, line2) abort
  let l:file = expand('%')

  " Handle fugitive buffers by parsing the URL directly
  if l:file =~# '^fugitive://'
    " fugitive://.../.git//<commit>/path/to/file
    " Parse out the path after the commit hash
    let l:match = matchlist(l:file, 'fugitive://.\{-}//[^/]\+/\zs.*$')
    if !empty(l:match) && !empty(l:match[0])
      let l:file = l:match[0]
    else
      echoerr 'Locate: could not parse fugitive URL: ' . l:file
      return
    endif
  endif

  if empty(l:file)
    echoerr 'Locate: current buffer has no file name'
    return
  endif

  let l:path = fnamemodify(l:file, ':.')
  let l:start = min([a:line1, a:line2])
  let l:end = max([a:line1, a:line2])

  if l:start == l:end
    let l:result = printf('%s:%d', l:path, l:start)
  else
    let l:result = printf('%s:%d-%d', l:path, l:start, l:end)
  endif

  let @+ = l:result
  echo 'Copied to clipboard: ' . l:result
endfunction

command! -range Locate call s:Locate(<line1>, <line2>)

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
