--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
-- Install Lazy if not found
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--load sub lua files
require('lazy').setup('plugins')
require('opts')      -- Options
require('keys')      -- Keymaps
require('lsp_cfg')     -- lsp config
require('cmds')         --autocmds
require('tele_cfg')         --telescope
require('dbg')         --debugger
