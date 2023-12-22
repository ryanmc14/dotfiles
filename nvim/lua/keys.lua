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
