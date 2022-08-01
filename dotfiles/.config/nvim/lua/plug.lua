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
    use 'tpope/vim-obsession'
    use 'junegunn/goyo.vim'
    use 'junegunn/limelight.vim'
    use 'mtdl9/vim-log-highlighting'
    use 'chrisbra/csv.vim'
    use 'lervag/wiki.vim'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
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
  end
)
