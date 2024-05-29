require("nvim-treesitter.configs").setup({
    -- Fedora does not ship neovim with parsers installed, but neovim>=0.10.0
    -- requires them.
    ensure_installed = { "c", "lua", "vim", "vimdoc", "markdown", "markdown_inline" },

    -- Disable highlighting completely, but preserve it for e.g. popup markdown
    -- windows like K hover. Note that for hovers in python code, python parser
    -- is still needed, but fortunately will not be used for normal editing.
    highlight = {
        enable = false,
    },
})
