--- use the system clipboard
vim.opt.clipboard = 'unnamedplus'
--- Remove the tilde in empty space
vim.opt.fillchars:append({ eob = " " })
--- Enable absolute line numbers
vim.opt.number = true

--- don't copy stuff when deleting
vim.keymap.set({'n', 'v'}, 'd', '"_d', { noremap = true })
vim.keymap.set('n', 'dd', '"_dd', { noremap = true })
vim.keymap.set({'n', 'v'}, 'x', '"_x', { noremap = true })

--- set tab  to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
