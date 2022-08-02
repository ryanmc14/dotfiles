--[[ opts.lua ]]
local opt = vim.opt

-- [[ Misc ]]
opt.mouse = "nv"
opt.completeopt = "menu,menuone,noselect"
opt.timeoutlen = 1000
opt.ttimeoutlen = 0
opt.shortmess = "A"

-- [[ Context ]]
--opt.colorcolumn = '80'           -- str:  Show col for max line length
--opt.number = true                -- bool: Show line numbers
--opt.relativenumber = true        -- bool: Show relative line numbers
opt.scrolloff = 4                -- int:  Min num lines of context
opt.signcolumn = "no"           -- str:  Show the sign column

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
vim.g.wiki_root = '~/Rsync/wiki'
vim.g.wiki_link_target_type='md'
vim.g.wiki_filetypes={'md'}
vim.g.wiki_write_on_nav=1
vim.g.wiki_mappings_use_defaults= 'local'
vim.g.gruvbox_guisp_fallback='bg'
