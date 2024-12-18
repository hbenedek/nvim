return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags)
      vim.keymap.set("n", "<leader>p", require("telescope.builtin").git_files)
      vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files)
      vim.keymap.set("n", "<space>fg", require("telescope.builtin").live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set("n", "<space>en", function()
        require("telescope.builtin").find_files {
          cwd = vim.fn.stdpath("config") }
      end)
      vim.keymap.set('n', '<space>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        require("telescope.builtin").current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })
      vim.keymap.set("n", "<Leader>sw", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
        silent)
      vim.keymap.set("n", "<Leader>cw", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
        silent)
    end
  }
}
