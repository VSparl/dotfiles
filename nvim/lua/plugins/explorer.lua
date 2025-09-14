return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            keymaps = {
                ["<LEADER>eo"] = {"actions.open_cwd", mode = "n", desc = "Open Explorer"},
                ["<LEADER>ec"] = {"actions.close", mode = "n", desc = "Close explorer"},
                ["<LEADER>eh"] = {"actions.toggle_hidden", mode = "n", desc = "Toggle hidden files"}
            }
        },
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    }
}
