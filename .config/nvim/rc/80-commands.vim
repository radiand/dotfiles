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

function! PlantUMLGenerateSVG()
   let command = ':!plantuml ' . expand('%:p') . ' -tsvg'
   silent execute command
   execute ':redraw!'
endfunction

" Stolen from: https://stackoverflow.com/a/30101152
function! DeleteHiddenBuffers()
   let tpbl=[]
   let closed = 0
   call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
   for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
      if getbufvar(buf, '&mod') == 0
         silent execute 'bwipeout' buf
         let closed += 1
      endif
   endfor
   echo "Closed " . closed . " hidden buffers"
endfunction

command Black :call Black()
command ISort :call ISort()
command Ruff :cexpr system("tox run --skip-pkg-install -qq -e ruff -- -q")
command Mypy :cexpr system("tox run --skip-pkg-install -q -e mypy")
command PlantUMLGenerateSVG :call PlantUMLGenerateSVG()
command PlantUMLCopyUrl :let @+='file://' . expand('%:p:r') . '.svg'
command PlantUMLSetCommentString :setlocal commentstring=\'\ %s
command DeleteHiddenBuffers :call DeleteHiddenBuffers()
command GetBufferPath let @+ = expand('%:p')
