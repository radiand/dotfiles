-- formatted with '$ stylua --indent-type Spaces --column-width 100'

require("mini.completion").setup()

vim.api.nvim_set_keymap(
    "i",
    "<Tab>",
    [[pumvisible() ? "\<C-n>" : "\<Tab>"]],
    { noremap = true, expr = true }
)
vim.api.nvim_set_keymap(
    "i",
    "<S-Tab>",
    [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]],
    { noremap = true, expr = true }
)
