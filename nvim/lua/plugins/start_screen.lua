return {
{ url = 'https://git.0x7be.net/dirk/boxdash', opts = {
        title = 'Neovim',  -- box title (set to '' to hide)
        align = {
            horizontal = 0,  -- horizontal box alignment
            vertical = 0,    -- vertical box alignment
            },
            style = 5,   -- One of the available styles (see below)
            entries = {  -- Menu entries
            { 'i', 'Switch to insert mode', 'insert_mode'  },
            { 'e', 'Show directory explorer', function() vim.api.nvim_command("Oil") end},
            { 'u', 'Update Lazy plugins',   'lazy_sync'    },
            '----------------------------------------------',
            { 'q', 'Quit Neovim',           'quit_neovim'  },
}
} }
}
