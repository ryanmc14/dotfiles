--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
map('i', 'jk', '<Esc>', {})
map('t', 'jk', '<C-\\><C-n>', {})
map('t', '<Esc>', '<C-\\><C-n>', {})

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
-- harpoon
map("n", "<leader>s", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {})
map("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", {})
map("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", {})
map("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", {})
map("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", {})

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>s", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
