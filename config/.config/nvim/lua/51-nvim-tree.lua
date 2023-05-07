require("nvim-tree").setup({
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
