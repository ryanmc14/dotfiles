return {
  'stevearc/oil.nvim',
  lazy = true,
  cmd  = {"Oil"},
  keys = {
      {"<leader>o", "<cmd>Oil<CR>", desc = "toggle Oil"},
  },
  opts = {},
  -- Optional dependencies
  dependencies = { "https://github.com/kyazdani42/nvim-web-devicons.git"
 },
}
