function ZettelGetRootDir()
    return trim(system('zettelkasten get ZettelkastenDir'))
endfunction

function ZettelCreate()
    " Create new zettelkasten note.
    let new_note_path = system('zettelkasten new')

    " Open buffer with new note.
    execute ":edit " . new_note_path

    " Jump cursor to the bottom.
    normal G
endfunction

function ZettelGoto()
    " Get UID under cursor and open the note in new buffer.

    let cur_word = expand("<cword>")
    let uid_pattern = "\\d\\{4}\\d\\{2}\\d\\{2}T\\d\\{2}\\d\\{2}\\d\\{2}Z"
    let uid = matchstr(cur_word, uid_pattern)
    if empty(uid)
        echo "No valid UID under cursor"
        return
    endif
    execute ":edit " .. ZettelGetRootDir() .. '/' .. uid .. ".md"
endfunction

command ZettelCreate :call ZettelCreate()
command ZettelGoto :call ZettelGoto()

nnoremap <leader>zk :ZettelCreate<CR>
nnoremap <leader>zg :ZettelGoto<CR>

" For telescope.nvim
" nnoremap <leader>zf :lua require("telescope.builtin").live_grep({cwd=vim.fn.ZettelGetRootDir(), additional_args={"--no-ignore"}})<CR>

" For fzf.vim
nnoremap <leader>zf :call RGPath(0, ZettelGetRootDir())<CR>
