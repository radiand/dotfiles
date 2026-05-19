require("kanagawa").setup({
    undercurl = false,
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none",
                },
            },
        },
    },
    overrides = function(colors)
        return {
            StatusLine = { bg = colors.theme.ui.bg_p2 },
            StatusLineNC = { bg = colors.theme.ui.bg_p1 },
            WinSeparator = { fg = colors.theme.ui.bg_p2 },
        }
    end,
})
