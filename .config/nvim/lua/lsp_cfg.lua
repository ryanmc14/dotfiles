local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Mappings.
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gl', ':Gitsigns toggle_current_line_blame<CR>', opts)
-- Use an on_attach function to only map the following keys after the lsp attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', 'vim.lsp.buf.references', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rf', 'function() vim.lsp.buf.format { async = true } end', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', 'vim.lsp.buf.declaration', opts)
end

local nvim_lsp = require('lspconfig')

nvim_lsp['jedi_language_server'].setup {
on_attach = on_attach,
capabilities = capabilities,
}

nvim_lsp['gopls'].setup{
on_attach = on_attach,
capabilities = capabilities,
settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  }
  }
