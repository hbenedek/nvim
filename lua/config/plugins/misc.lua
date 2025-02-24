return {
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		version = "*",
		opts = {
			size = 10,
			open_mapping = "<C-j>",
		}
	},
	{
		-- Hints keybinds
		'folke/which-key.nvim',
		config = function() -- This is the function that runs, AFTER loading
			require('which-key').setup()

			-- Document existing key chains
			require('which-key').register {
				['<leader>f'] = { name = '[S]earch', _ = 'which_key_ignore' },
			}
		end
	},
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = true,
		opts = {},
	},
	{ 'sindrets/diffview.nvim' },
	{ 'xiyaowong/transparent.nvim' },
	-- {
	--		"m4xshen/hardtime.nvim",
	--		dependencies = { "MunifTanjim/nui.nvim" },
	--		opts = {}
	-- },
}
