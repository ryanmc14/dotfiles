--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plug
require('lsp_cfg')     -- lsp config
require('cmp_cfg')     -- cmp config
require('ts_cfg')       --treesitter config
require('cmds')         --autocmds
require('harp_cfg')         --autocmds
require('tele_cfg')         --autocmds
