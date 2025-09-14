-- use the system clipboard
vim.opt.clipboard = 'unnamedplus'
-- Remove the tilde in empty space
vim.opt.fillchars:append({ eob = " " })
-- Enable absolute line numbers
vim.opt.number = true
-- Disable word wrap
vim.opt.wrap = false

-- set tab  to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- set leader keys
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load configs defined in other files
require("config.keybinds")
require("config.terminal")
require("config.lazy")
