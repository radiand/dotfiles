function ZettelGetRootDir()
    let pattern = 'path\s?=\s?"\K[^"]+'
    let cmd = "grep -oP '" .. pattern .. "' $HOME/.config/zettelkasten/config.toml"
    let path = system(cmd)
    return trim(substitute(path, "\\~", $HOME, ""))
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
nnoremap <leader>zf :lua require("telescope.builtin").live_grep({cwd=vim.fn.ZettelGetRootDir()})<CR>
