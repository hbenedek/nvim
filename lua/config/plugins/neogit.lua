return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
    "echasnovski/mini.pick",         -- optional
  },
  config = function()
    vim.keymap.set("n", "<leader>gs", require("neogit").open)
    vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>gB", ":G blame<CR>",
      { silent = true, noremap = true }
    )
  end
}
