return {
  'stevearc/oil.nvim',
  lazy = true,
  cmd  = {"Oil"},
  keys = {
      {"<leader>o", "<cmd>lua require('oil').open_float('.')<CR>", desc = "toggle Oil"},
  },
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
