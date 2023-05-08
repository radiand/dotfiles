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

    -- use all default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- add some
    vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
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
