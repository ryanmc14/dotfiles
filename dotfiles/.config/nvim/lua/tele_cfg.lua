require('telescope').setup{}
M = {}
function M.wiki_search()
  require('telescope.builtin').find_files {
    winblend = 5,
    border = true,
    cwd = vim.fn.stdpath('data') .. '~/Rsync/wiki/'
  }
end

vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope fd <CR>', {})
vim.api.nvim_set_keymap('n', '<leader>fw', ':Telescope fd cwd=~/Rsync/wiki <CR>', {})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep <CR>', {})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers <CR>', {})
