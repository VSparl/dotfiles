-- don't copy stuff when deleting
vim.keymap.set({'n', 'v'}, 'd', '"_d', { noremap = true })
vim.keymap.set('n', 'dd', '"_dd', { noremap = true })
-- don't copy single characters when deleting
vim.keymap.set('n', 'x', '"_dl')

-- remove highlighting when pressing escape
vim.keymap.set({'n'}, '<ESC>', '<CMD>nohls<CR>', { noremap = true })

-- Map Ctrl+V to paste in insert mode
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })

-- Diagnostics
vim.keymap.set({'n'}, '<LEADER>d', '<CMD>lua vim.diagnostic.open_float()<CR>', { desc = 'Show diagnostics under the cursor' })

-- Open file explorer. Further keymaps are in the config file of the explorer plugin.
vim.keymap.set({'n'}, '<LEADER>eo', '<CMD>:Oil<CR>', { desc = 'Open file explorer here' })

-- Select everything in document
vim.keymap.set({'n', 'i', 'v'}, '<C-a>', '<ESC>ggVG', { desc = 'Select entire buffer' })

-- Code folding
vim.opt.foldlevelstart = 3  -- Fold deeply nested things on buffer open
vim.opt.foldmethod = 'indent'  -- use indentation to generate folds
vim.keymap.set('n', '<LEADER>ff', 'za', { desc = 'Toggle fold' })
vim.keymap.set('n', '<LEADER>fu', 'zR', { desc = 'Unfold all' })

-- Text wrapping
vim.keymap.set('n', '<LEADER>w', '<CMD>:set wrap<CR><CMD>:set linebreak<CR>', {desc = 'Enable text wrapping'})
