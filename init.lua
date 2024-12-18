print("Hello")

require("options")
require("keymaps")
require("config.lazy")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd('TermOpen', {
	group = vim.api.nvim_create_augroup('custom-open-term', { clear = true }),
	callback = function()
		vim.opt.number = false
	end
})

vim.keymap.set({ "n", "t" }, "<C-j>", function()
	-- Get the current window's type
	local buftype = vim.api.nvim_buf_get_option(0, "buftype")

	-- If the current window is a terminal, close it
	if buftype == "terminal" then
		vim.cmd("close")
	else
		-- Otherwise, open a new terminal
		vim.cmd.vnew()
		vim.cmd.term()
		vim.cmd.wincmd("J")
		vim.api.nvim_win_set_height(0, 10)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i", true, false, true), "n", false)
	end
end)
