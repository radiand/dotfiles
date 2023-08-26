-- formatted with '$ stylua --indent-type Spaces --column-width 100'

require("oil").setup({
    default_file_explorer = true,
    columns = {},
    use_default_keymaps = false,
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
    },
})

vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>")
