return {
    {
        "mason-org/mason.nvim",  -- LSP server manager
        opts = {}
    },

    {
        "mason-org/mason-lspconfig.nvim",  -- LSP server configurator
        opts = {
            ensure_installed = { "lua_ls", "pyright", "gopls" },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },

    {
      "nvimtools/none-ls.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function ()
        local null_ls = require("null-ls")

        null_ls.setup({
          sources = {
            -- Formatters
            null_ls.builtins.formatting.goimports,
            null_ls.builtins.formatting.gofumpt,
            -- Linters
            null_ls.builtins.diagnostics.golangci_lint,
          },
          on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
              local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
              vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format({ bufnr = bufnr })
                end,
              })
            end
          end,
        })
      end,
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
            ensure_installed = { "lua", "python", "markdown", "json", "go" },  -- Languages for which parsers should be downloaded
            highlight = { enable = true },
        },
    },
}
