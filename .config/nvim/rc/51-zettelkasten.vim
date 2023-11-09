let g:zettelkasten = "$HOME/wiki/zettelkasten/"

function ZettelCreate(text)
    " Create new zettelkasten note.
    "
    " Args:
    "   text: String which will be used to generate filename and note's title.
    "       For title, 'text' is directly copied.
    "       For filename, 'text' has all whitespaces replace with a hyphen and
    "           whole string is made lowercase.

    " Use ISO-8601 compatible format, being also filesystem friendly.
    let timestamp = trim(system('date -u +"%Y%m%dT%H%M%SZ"'))

    " Remove surrounding whitespace to prevent filename cluttering.
    let text = trim(a:text)

    if empty(text)
        let filename = ""
        let title = ""
        let uid = timestamp
    else
        let filename = tolower(substitute(text, '\s', '-', 'g'))
        let title = text
        let uid = timestamp . '-' . filename
    endif

    " Open buffer with new note.
    execute ":edit " g:zettelkasten . uid . ".md"

    let local_timestamp = trim(system('date --iso-8601=seconds'))

    " Generate header being a valid TOML for the ease of further scripting.
    call append(0, '```toml')
    call append(1, 'title = "' . title . '"')
    call append(2, 'timestamp = ' . local_timestamp)
    call append(3, 'uid = "' . uid . '"')
    call append(4, 'tags = []')
    call append(5, 'referred_from = []')
    call append(6, 'refers_to = []')
    call append(7, '```')

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
    execute ":edit " . g:zettelkasten . uid . ".md"
endfunction

command -nargs=* ZettelCreate :call ZettelCreate(<q-args>)
command ZettelGoto :call ZettelGoto()

nnoremap <leader>zk :ZettelCreate<CR>
nnoremap <leader>zg :ZettelGoto<CR>
nnoremap <leader>zf :lua require("telescope.builtin").live_grep({cwd="<C-r>=zettelkasten<CR>"})<CR>
