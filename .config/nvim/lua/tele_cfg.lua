require('telescope').setup{}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "find files"})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {desc = "oldfiles"})
vim.keymap.set('n', '<leader>fr', builtin.live_grep, {desc = "live_grep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "buffers"})
vim.keymap.set('n', '<leader>fs', builtin.spell_suggest, {desc = "spell_suggest"})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {desc = "diagnostics"})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {desc = "treesitter"})
vim.keymap.set('n', '<leader>gc', builtin.git_bcommits, {desc = "git_bcommits"})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {desc = "git_branches"})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {desc = "git_status"})
vim.keymap.set('n', '<leader>fh', ':Telescope find_files hidden=true<cr>', {desc = "find hidden files"})

-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
