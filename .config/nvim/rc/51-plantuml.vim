function! PlantUMLRenderBuffer(format="svg")
   let command = ':!plantuml ' . expand('%:p') . ' -t' . a:format . ' -o/tmp'
   silent execute command
   execute ':redraw!'
endfunction

function! PlantUMLRenderBlock(format="svg")
   " Remeber cursor and window position.
   let winview_state = winsaveview()

   " Select everything between ```plantuml fenced block, nearest of the
   " cursor.
   let start = search("```", "b") + 1
   let end = search("```") - 1

   " Restore cursor position.
   call winrestview(winview_state)

   " Get lines between fenced block and concatenate.
   let lines = getline(start, end)
   let joined_lines = join(lines, "\n")

   let intermediate_path = "/tmp/" . expand('%:t:r') . ".puml"

   " Write fenced block to intermediate file.
   let command = ":" . start . "," . end . "w! " . intermediate_path
   silent execute command

   " Call plantuml on intermediate file.
   let command = ':!plantuml ' . intermediate_path . ' -t' . a:format . ' -o/tmp'
   silent execute command

   " Redraw screen and finish.
   execute ':redraw!'
   echo "Rendered PUML to " . intermediate_path
endfunction

function! PlantUMLShow(format="svg")
   let command = ":!(display -update 1 /tmp/" . expand('%:t:r') . "." . a:format . " &)"
   silent execute command
   execute ':redraw!'
endfunction

command -nargs=? PlantUMLRenderBlock :call PlantUMLRenderBlock(<f-args>)
command -nargs=? PlantUMLRenderBuffer :call PlantUMLRenderBuffer(<f-args>)
command -nargs=? PlantUMLShow :call PlantUMLShow(<f-args>)
command PlantUMLCopyUrl :let @+='file:///tmp/' . expand('%:t:r') . '.svg'
command PlantUMLSetCommentString :setlocal commentstring=\'\ %s
