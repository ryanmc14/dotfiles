--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
map('i', 'jk', '<Esc>', {})
map('t', 'jk', '<C-\\><C-n>', {})
map('t', '<Esc>', '<C-\\><C-n>', {})
map('i', 'jj', '<Esc>', {})

-- Copy and Paste
map('n', 'Y', 'yg_', {})
map('n', '<leader>y', '"+y', {})
map('n', '<leader>p', '"+p', {})
map('v', '<leader>y', '"+y', {})
map('v', '<leader>p', '"+p', {})
-- move lines up and down
map('v', 'K', ":m '<-2<CR>gv=gv", {})
map('v', 'J', ":m '>+1<CR>gv=gv", {})
-- undo / redo
map('n','U', "<C-R>", {})

map('n', 'q:', '<nop>', {})

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({
    settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
    key = function()
        return vim.loop.cwd()
    end,
}}
)
-- harpoon
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {desc='Harpoon add'})
vim.keymap.set("n", "<leader>A", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc='Harpoon List'})
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, {desc='Harpoon 1'})
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, {desc='Harpoon 2'})
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, {desc='Harpoon 3'})
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, {desc='Harpoon 4'})
