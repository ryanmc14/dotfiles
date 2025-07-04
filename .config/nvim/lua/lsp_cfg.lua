-- Mappings.
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- Use an on_attach function to only map the following keys after the lsp attaches to the current buffer
local on_attach = function(client, bufnr)
vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', 'function() vim.lsp.buf.format { async = true } end', opts)
end

local nvim_lsp = require('lspconfig')

nvim_lsp['pyright'].setup {
on_attach = on_attach,
capabilities = capabilities,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
--capabilities = require('blink.cmp').get_lsp_capabilities({textDocument = { completion = { completionItem = { snippetSupport = true } } },})

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
      matcher = "caseInsensitive"
    },
  },
  init_options = {
    usePlaceholders = true,
  },
  }

nvim_lsp.csharp_ls.setup{
}

nvim_lsp.denols.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
}

nvim_lsp.terraformls.setup{
}
