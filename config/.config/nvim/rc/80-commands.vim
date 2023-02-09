function! Black()
   let save_pos = getpos(".")
   execute ':%!black -q -l 100 - 2>/dev/null'
   call setpos(".", save_pos)
endfunction

function! ISort()
   let save_pos = getpos(".")
   execute ':%!python3 -m isort - 2>/dev/null'
   call setpos(".", save_pos)
endfunction

function! PlantUMLGenerateSVG()
   let command = ':!java -jar $HOME/bin/plantuml.jar -DPLANTUML_LIMIT_SIZE=8192 -Dawt.useSystemAAFontSettings=on ' . expand('%:p') . ' -tsvg'
   silent execute command
   execute ':redraw!'
endfunction

command Black :call Black()
command ISort :call ISort()
command PlantUMLGenerateSVG :call PlantUMLGenerateSVG()
command PlantUMLCopyUrl :let @+='file://' . expand('%:p:r') . '.svg'
