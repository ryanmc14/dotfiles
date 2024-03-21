return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  lazy = true,
  	dependencies = {
		"nvim-lua/plenary.nvim",
	},
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
  },
  }
