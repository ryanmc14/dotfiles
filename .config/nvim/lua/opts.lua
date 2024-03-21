--[[ opts.lua ]]
local opt = vim.opt

-- [[ Misc ]]
opt.mouse = "a"
opt.completeopt = "menu,menuone,noselect"
opt.timeoutlen = 500
opt.ttimeoutlen = 0
opt.shortmess = "A"
opt.clipboard = ""

-- [[ Context ]]
--opt.colorcolumn = '80'           -- str:  Show col for max line length
opt.number = true                -- bool: Show line numbers
opt.relativenumber = false        -- bool: Show relative line numbers
opt.scrolloff = 4                -- int:  Min num lines of context
opt.wrap = false
opt.linebreak = true            -- bool: wrap on full words not half way through

-- [[ Filetypes ]]
opt.encoding = 'utf8'            -- str:  String encoding to use
opt.fileencoding = 'utf8'        -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- [[ Search ]]
opt.ignorecase = true            -- bool: Ignore case in search patterns
opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
opt.incsearch = true             -- bool: Use incremental search
opt.hlsearch = true             -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true             -- bool: Use spaces instead of tabs
opt.shiftwidth = 4               -- num:  Size of an indent
opt.softtabstop = 4              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4                  -- num:  Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true            -- bool: Place new window to right of current one
opt.splitbelow = true            -- bool: Place new window below the current one

 -- [[ Wildmenu ]]
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignorecase = true
opt.laststatus = 2


-- [[ plugin specific ]]
vim.g.limelight_conceal_ctermfg = 'gray'
vim.g.limelight_conceal_ctermfg = 240
vim.g.mkdp_refresh_slow=1
vim.g.mkdp_preview_options =
    {['disable_filename'] = 1
}
vim.g.wiki_root = '~/Rsync/wiki/content/md'
vim.g.wiki_write_on_nav=1
--vim.g.wiki_select_method='ui_select'
vim.g.wiki_mappings_use_defaults= 'local'

vim.g.gruvbox_guisp_fallback='bg'

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'tabs', 'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}


require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
