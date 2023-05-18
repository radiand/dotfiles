local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fl", builtin.loclist, {})
vim.keymap.set("n", "<leader>fq", builtin.quickfix, {})
vim.keymap.set("n", "<leader>fw", builtin.grep_string, {})

require("telescope").setup({
    pickers = {
        buffers = {
            show_all_buffers = true,
            -- Use <C-d> to delete buffers within buffers picker.
            mappings = {
                i = {
                    ["<c-d>"] = "delete_buffer",
                },
            },
        },
    },
})
