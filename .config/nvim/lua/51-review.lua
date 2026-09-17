-- $ stylua --indent-type Spaces --column-width 100

-- ─── Paths ────────────────────────────────────────────────────────────────────

local cache_dir = vim.fn.stdpath("cache") .. "/review"
local current_file = cache_dir .. "/current.md"
local last_file = cache_dir .. "/last.md"

-- ─── Session state ────────────────────────────────────────────────────────────

local session_active = false

-- ─── I/O helpers ──────────────────────────────────────────────────────────────

local function ensure_cache_dir()
    vim.fn.mkdir(cache_dir, "p")
end

---@param path string
---@return string|nil
local function read_file(path)
    local f = io.open(path, "r")
    if not f then
        return nil
    end
    local content = f:read("*a")
    f:close()
    return content
end

---@param path string
---@param content string
local function write_file(path, content)
    ensure_cache_dir()
    local f = assert(io.open(path, "w"))
    f:write(content)
    f:close()
end

---@param path string
---@param content string
local function append_file(path, content)
    ensure_cache_dir()
    local f = assert(io.open(path, "a"))
    f:write(content)
    f:close()
end

-- ─── Location ─────────────────────────────────────────────────────────────────

--- Return source location like `src/main.c:42` or `src/main.c:78-92`.
--- Parses fugitive:// URLs to recover the underlying repository path.
---@param line1 integer
---@param line2 integer
---@return string|nil location, string|nil err
local function location(line1, line2)
    local file = vim.fn.expand("%")

    if file:match("^fugitive://") then
        local path_after_commit = file:match("^fugitive://.-//[^/]+/(.*)$")
        if not path_after_commit or path_after_commit == "" then
            return nil, "could not parse fugitive URL: " .. file
        end
        file = path_after_commit
    end

    if file == "" then
        return nil, "current buffer has no file name"
    end

    local path = vim.fn.fnamemodify(file, ":.")
    local s = math.min(line1, line2)
    local e = math.max(line1, line2)

    if s == e then
        return string.format("%s:%d", path, s)
    end
    return string.format("%s:%d-%d", path, s, e)
end

-- ─── Popup ────────────────────────────────────────────────────────────────────

--- Open a centered floating popup and invoke `on_submit(text)` when the user
--- confirms with `<CR>` (normal) or `<C-s>` (insert). `q` cancels.
---@param title string
---@param on_submit fun(text: string)
local function open_popup(title, on_submit)
    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].filetype = "markdown"

    local width = math.min(90, math.max(50, math.floor(vim.o.columns * 0.6)))
    local height = math.min(15, math.max(6, math.floor(vim.o.lines * 0.3)))
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
        title = " " .. title .. " ",
        title_pos = "center",
        footer = " <CR>/<C-s> submit · q cancel ",
        footer_pos = "center",
    })

    local closed = false
    local function close()
        if closed then
            return
        end
        closed = true
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
        end
        vim.cmd("stopinsert")
    end

    local function submit()
        local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
        close()
        local text = table.concat(lines, "\n"):gsub("^%s+", ""):gsub("%s+$", "")
        if text == "" then
            vim.notify("review: empty comment discarded", vim.log.levels.WARN)
            return
        end
        on_submit(text)
    end

    local map_opts = { buffer = buf, silent = true, nowait = true }
    vim.keymap.set("n", "<CR>", submit, map_opts)
    vim.keymap.set("i", "<C-s>", submit, map_opts)
    vim.keymap.set("n", "q", close, map_opts)

    vim.cmd("startinsert")
end

-- ─── Commands ─────────────────────────────────────────────────────────────────

---@param line1 integer
---@param line2 integer
local function cmd_review(line1, line2)
    local loc, err = location(line1, line2)
    if not loc then
        vim.notify("review: " .. err, vim.log.levels.ERROR)
        return
    end
    if not session_active then
        ensure_cache_dir()
        write_file(current_file, "")
        session_active = true
        vim.notify("review: new session started")
    end
    open_popup(loc, function(text)
        append_file(current_file, string.format("# %s\n%s\n\n", loc, text))
        vim.notify("review: entry added for " .. loc)
    end)
end

local function cmd_stop()
    if not session_active then
        vim.notify("review: no active session", vim.log.levels.ERROR)
        return
    end
    session_active = false
    local content = read_file(current_file)
    if not content or content == "" then
        vim.notify("review: session ended (no entries)", vim.log.levels.WARN)
        return
    end
    write_file(last_file, content)
    vim.fn.setreg("+", content)
    vim.notify("review: session ended, copied to clipboard")
end

local function cmd_copy()
    local content = read_file(last_file)
    if not content or content == "" then
        vim.notify("review: no previous session to copy", vim.log.levels.ERROR)
        return
    end
    vim.fn.setreg("+", content)
    vim.notify("review: last session copied to clipboard")
end

--- Open the review file for editing. Uses the current session if active,
--- otherwise the last completed session.
local function cmd_edit()
    local path = session_active and current_file or last_file
    if vim.fn.filereadable(path) == 0 then
        vim.notify("review: nothing to edit", vim.log.levels.ERROR)
        return
    end
    vim.cmd("split " .. vim.fn.fnameescape(path))
end

-- ─── Registration ─────────────────────────────────────────────────────────────

vim.api.nvim_create_user_command("Review", function(opts)
    cmd_review(opts.line1, opts.line2)
end, {
    range = true,
    desc = "Add a review entry for the current line or range; starts a session if none is active",
})

vim.api.nvim_create_user_command("ReviewStop", cmd_stop, {
    desc = "Finish the review session and copy it to the clipboard",
})

vim.api.nvim_create_user_command("ReviewCopy", cmd_copy, {
    desc = "Copy the last completed review session to the clipboard",
})

vim.api.nvim_create_user_command("ReviewEdit", cmd_edit, {
    desc = "Open the current (or last) review in a split for editing",
})
