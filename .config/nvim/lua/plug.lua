--packer setup
-- vars
local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--- startup and add configure plugins
packer.startup(function()
  local use = use
  -- add you plugins here like:
    use 'neovim/nvim-lspconfig'
    use { "ellisonleao/gruvbox.nvim" }
    use 'folke/tokyonight.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use ({ 'projekt0n/github-nvim-theme' })
    use 'tpope/vim-obsession'
    use 'junegunn/goyo.vim'
    use 'junegunn/limelight.vim'
    use 'mtdl9/vim-log-highlighting'
    use 'chrisbra/csv.vim'
    use 'lervag/wiki.vim'
    use("christoomey/vim-tmux-navigator")
    use({'nvim-telescope/telescope.nvim', tag= '0.1.0'})
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'rafamadriz/friendly-snippets'
    use 'nvim-lua/plenary.nvim'
    use 'ThePrimeagen/harpoon'
    use 'nvim-treesitter/nvim-treesitter'
    use 'psf/black'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'tpope/vim-fugitive'
    use 'sago35/tinygo.vim'
    use 'itchyny/calendar.vim'
    use 'lewis6991/gitsigns.nvim'
    use 'tomiis4/Hypersonic.nvim'
    use 'folke/which-key.nvim'
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })
    use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
    use 'stevearc/dressing.nvim'
use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
    use 'simrat39/symbols-outline.nvim'
  end
)
