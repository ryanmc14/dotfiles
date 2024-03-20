return {
  'stevearc/oil.nvim',
  lazy = true,
  cmd  = {"Oil"},
  keys = {
      {"<leader>o", "<cmd>Oil<CR>", desc = "toggle Oil"},
  },
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
