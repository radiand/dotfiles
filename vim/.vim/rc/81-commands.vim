function! Black()
   let save_pos = getpos(".")
   "execute ':%!black -q -l 100 -t py37 - 2>/dev/null'
   execute ':%!black -q -l 100 - 2>/dev/null'
   call setpos(".", save_pos)
endfunction

command Black :call Black()

function! PlantUMLGenerateSVG()
   let command = ':!java -jar $HOME/bin/plantuml.jar -DPLANTUML_LIMIT_SIZE=8192 -Dawt.useSystemAAFontSettings=on ' . expand('%:p') . ' -tsvg'
   silent execute command
   execute ':redraw!'
endfunction

function! PlantUMLChrome()
   let command = ':!google-chrome-stable ' . expand('%:r') . '.svg'
   silent execute command
   execute ':redraw!'
endfunction

function! PlantUMLShow()
   let command = ':!xdg-open ' . expand('%:r') . '.png'
   execute command
endfunction

command PlantUMLGenerateSVG :call PlantUMLGenerateSVG()
command PlantUMLChrome :call PlantUMLChrome()
