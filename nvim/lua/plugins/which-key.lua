return {
    {
        "folke/which-key.nvim",  -- Show available keybinds
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer local keymaps (which-key)",
            },
        },
    },
}
