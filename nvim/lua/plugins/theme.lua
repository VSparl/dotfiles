return {
    {
        "sainnhe/everforest",
        lazy = false,
        priority=1000,
        config = function()
            vim.g.everforest_enable_italic = 1
            vim.g.everforest_diagnostic_text_highlight = 1  -- Highlight errors, warnings, etc.
            vim.g.everforest_disable_terminal_colors = 1  -- Keep same terminal colours as outside nvim
            vim.g.everforest_background = "hard"  -- Stronger contrast
            -- vim.g.everforest_transparent_background = 1
            vim.cmd([[colorscheme everforest]])
        end,
    },


    { "nvim-tree/nvim-web-devicons", lazy = true },
}
