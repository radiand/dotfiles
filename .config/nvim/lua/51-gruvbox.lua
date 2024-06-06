-- formatted with '$ stylua --indent-type Spaces --column-width 100'

require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
        -- Make gutter have same color as background.
        SignColumn = { link = "Normal" },
        GruvboxAquaSign = { bg = "" },
        GruvboxBlueSign = { bg = "" },
        GruvboxGreenSign = { bg = "" },
        GruvboxOrangeSign = { bg = "" },
        GruvboxPurpleSign = { bg = "" },
        GruvboxRedSign = { bg = "" },
        GruvboxYellowSign = { bg = "" },
    },
    dim_inactive = false,
    transparent_mode = false,
})
