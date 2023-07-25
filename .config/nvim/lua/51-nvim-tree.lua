local function nvim_tree_custom_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#nerdtree-style-copy-file-to
    local function copy_file_to(node)
        local file_src = node["absolute_path"]
        -- The args of input are {prompt}, {default}, {completion}
        -- Read in the new file path using the existing file's path as the baseline.
        local file_out = vim.fn.input("COPY TO: ", file_src, "file")
        -- Create any parent dirs as required
        local dir = vim.fn.fnamemodify(file_out, ":h")
        vim.fn.system({ "mkdir", "-p", dir })
        -- Copy the file
        vim.fn.system({ "cp", "-R", file_src, file_out })
    end

    -- https://github.com/nvim-tree/nvim-tree.lua/issues/2287
    local function move_file_to()
        local node = api.tree.get_node_under_cursor()
        local file_src = node["absolute_path"]
        local file_out = vim.fn.input("MOVE TO: ", file_src, "file")
        local dir = vim.fn.fnamemodify(file_out, ":h")
        vim.fn.system({ "mkdir", "-p", dir })
        vim.fn.system({ "mv", file_src, file_out })
    end

    -- use all default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- add some
    vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
    vim.keymap.set("n", "C", copy_file_to, opts("Copy File To"))
    vim.keymap.set("n", "M", move_file_to, opts("Move File To"))
end

require("nvim-tree").setup({
    on_attach = nvim_tree_custom_attach,
    view = {
        width = 40,
    },
    git = {
        show_on_dirs = false,
    },
    filters = {
        dotfiles = true,
    },
    renderer = {
        -- Add trailing slash after folder names.
        add_trailing = true,
        highlight_opened_files = "name",
        icons = {
            webdev_colors = false,
            git_placement = "after",
            padding = " ",
            show = {
                file = true,
                folder = false,
                folder_arrow = true,
                git = true,
                modified = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "B",
                modified = "+",
                folder = {
                    arrow_closed = "▶",
                    arrow_open = "▼",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "M",
                    staged = "+",
                    unmerged = "",
                    renamed = "R",
                    untracked = "??",
                    deleted = "D",
                    ignored = "I",
                },
            },
        },
    },
})
