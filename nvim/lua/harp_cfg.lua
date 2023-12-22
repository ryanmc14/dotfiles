
vim.api.nvim_set_keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>s", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", {})
