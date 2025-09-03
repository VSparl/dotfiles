-- use the system clipboard
vim.opt.clipboard = 'unnamedplus'
-- Remove the tilde in empty space
vim.opt.fillchars:append({ eob = " " })
-- Enable absolute line numbers
vim.opt.number = true
-- Disable word wrap
vim.opt.wrap = false

-- don't copy stuff when deleting
vim.keymap.set({'n', 'v'}, 'd', '"_d', { noremap = true })
vim.keymap.set('n', 'dd', '"_dd', { noremap = true })

-- set tab  to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- remove highlighting when pressing escape
vim.keymap.set({'n'}, '<ESC>', '<CMD>nohls<CR>', { noremap = true })

-- set leader keys
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({'n'}, '<leader>d', '<CMD>lua vim.diagnostic.open_float()<CR>', { desc = 'Show diagnostics under the cursor' })

-- Map Ctrl+V to paste in insert mode
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })

-- Add `:Whitespace` as command to trim trailing whitespace
vim.api.nvim_create_user_command('Whitespace', '%s/\\s\\+$//g', {})

-- Load terminal config and plugins
require("config.terminal")
require("config.lazy")
