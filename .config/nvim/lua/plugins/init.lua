return {
--- startup and add configure plugins
  -- add you plugins here like:
    'neovim/nvim-lspconfig',
    'folke/tokyonight.nvim',
    'ellisonleao/gruvbox.nvim',
    "catppuccin/nvim",
    ({ 'projekt0n/github-nvim-theme' }),
    'tpope/vim-obsession',
    'mtdl9/vim-log-highlighting',
    ("christoomey/vim-tmux-navigator"),
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'sago35/tinygo.vim',
    'itchyny/calendar.vim',
    'lewis6991/gitsigns.nvim',
    'folke/which-key.nvim',
    'nvim-neotest/nvim-nio',
    'onsails/lspkind.nvim',
    "darianmorat/gruvdark.nvim",
    {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons'}
        },
{
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
}
