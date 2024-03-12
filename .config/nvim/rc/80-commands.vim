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

function! PlantUMLGenerate(format="svg")
   let command = ':!plantuml ' . expand('%:p') . ' -t' . a:format . ' -o/tmp'
   silent execute command
   execute ':redraw!'
endfunction

function! PlantUMLShow(format="svg")
   let command = ":!(display -update 1 /tmp/" . expand('%:t:r') . "." . a:format . " &)"
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
command -nargs=? PlantUMLGenerate :call PlantUMLGenerate(<f-args>)
command -nargs=? PlantUMLShow :call PlantUMLShow(<f-args>)
command PlantUMLCopyUrl :let @+='file:///tmp/' . expand('%:t:r') . '.svg'
command PlantUMLSetCommentString :setlocal commentstring=\'\ %s
command DeleteHiddenBuffers :call DeleteHiddenBuffers()
command GetBufferPath let @+ = expand('%:p')
