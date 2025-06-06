require("conform").setup({
    formatters_by_ft = {
        json = { "jq" },
        lua = { "stylua" },
        python = { "isort", "ruff_format" },
        yaml = { "yamlfmt" },
    },
})

require("conform").formatters.stylua = {
    prepend_args = { "--indent-type", "Spaces", "--column-width", "100" },
}

vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

vim.keymap.set("n", "<leader>fo", "<CMD>Format<CR>")
