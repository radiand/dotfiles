require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "vim",
        "vimdoc",
    },
    highlight = {
        enable = true,
        disable = { "markdown" },
    },
})
