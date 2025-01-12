--- make nvim use the system clipboard
vim.opt.clipboard = 'unnamedplus'

--- make Shift+L select the current line
vim.keymap.set('n', 'L', function()
	vim.api.nvim_command('normal! 0v$h')
end)
