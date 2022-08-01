--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
map('i', 'jk', '<Esc>', {})
map('t', 'jk', '<C-\\><C-n>', {})
map('t', '<Esc>', '<C-\\><C-n>', {})

-- Copy and Paste
map('n', '<leader>p', '"+p', {})
map('n', '<leader>y', '"+y', {})
map('v', '<leader>y', '"+y', {})
map('n', 'Y', 'yg_', {})

-- move lines up and down
map('v', 'K', ":m '<-2<CR>gv=gv", {})
map('v', 'J', ":m '>+1<CR>gv=gv", {})

-- move between splits
map('n', '<leader>l', '<C-W><C-L>', {})
map('n', '<leader>h', '<C-W><C-H>', {})
map('t', '<leader>l', '<C-W><C-L>', {})
map('t', '<leader>h', '<C-W><C-H>', {})
