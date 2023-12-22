--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","

require('plug')      -- Plug
require('opts')      -- Options
require('keys')      -- Keymaps
require('lsp_cfg')     -- lsp config
require('cmp_cfg')     -- cmp config
require('ts_cfg')       --treesitter config
require('cmds')         --autocmds
require('harp_cfg')         --harpoon
require('tele_cfg')         --telescope
require('dbg')         --debugger
