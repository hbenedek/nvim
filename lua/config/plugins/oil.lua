return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require("oil").setup {
      columns = { "icon" },
      keymaps = {
        ["<M-h>"] = "actions.select_split",
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-k>"] = false,
        ["<C-j>"] = false,
      },
      view_options = {
        show_hidden = true,
      },

      -- Open parent directory in current window
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

    }
  end
}
