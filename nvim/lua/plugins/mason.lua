return {
    {
        "mason-org/mason.nvim",  -- LSP server manager
        opts = {}
    },

    {
        "mason-org/mason-lspconfig.nvim",  -- LSP server configurator
        opts = {
            ensure_installed = { "lua_ls", "pyright" },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },

    {
        "hrsh7th/nvim-cmp",  -- Autocompletion engine
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },  -- Sources for completion snippets
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },  -- From LSP
                    { name = "luasnip" },  -- From snippet provider
                    { name = "buffer" },  -- From inside file
                    { name = "path" },  -- Paths around the file
                }),
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",  -- Parsing & Syntax highlighting
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "lua", "python", "markdown", "json" },  -- Languages for which parsers should be downloaded
            highlight = { enable = true },
        },
    },
}
