return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
		},
		config = function()
			require('telescope').setup {
				defaults = {
					mappings = {
						i = {
							['<C-k>'] = require('telescope.actions').move_selection_previous, -- move to prev result
							['<C-j>'] = require('telescope.actions').move_selection_next, -- move to next result
							['<C-l>'] = require('telescope.actions').select_default,   -- open file
						},
					},
				},
				pickers = {
					find_files = {
						file_ignore_patterns = { 'node_modules', '.git', '.venv' },
						hidden = true,
					},
				},
				live_grep = {
					file_ignore_patterns = { 'node_modules', '.git', '.venv' },
					additional_args = function(_)
						return { '--hidden' }
					end,
				},
			}

			vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags, { desc = "[F]ind [H]elp Tags" })
			vim.keymap.set("n", "<leader>p", require("telescope.builtin").git_files, { desc = "[F]ind Git files" })
			vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files, { desc = "[F]ind by [D]irectory" })
			vim.keymap.set("n", "<space>fg", require("telescope.builtin").live_grep, { desc = '[F]ind by [G]rep' })
			vim.keymap.set("n", "<leader><space>", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
			vim.keymap.set("n", "<space>fc", function()
				require("telescope.builtin").find_files {
					cwd = vim.fn.stdpath("config") }
			end, { desc = "[F]ind [C]onfig" })
			vim.keymap.set('n', '<space>/', function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				require("telescope.builtin").current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end, { desc = '[/] Fuzzily search in current buffer' })
			vim.keymap.set("n", "<Leader>fw", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
				{ desc = "[F]ind [W]orktress" })
			vim.keymap.set("n", "<Leader>cw", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
				{ desc = "[C]reate [W]orktree" })
			local function showOnlyFunctions()
				local opts = { symbols = { "function", "method" } }
				require('telescope.builtin').lsp_document_symbols(opts)
			end
			vim.keymap.set("n", "<leader>ff", showOnlyFunctions, { desc = "[F]ind [F]unctions" })
		end
	}
}
