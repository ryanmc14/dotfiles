require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require "cmp"
cmp.setup {
  snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),

        ["<Tab>"] = cmp.mapping(
        function(fallback)
            if cmp.visible() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
            elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
                fallback()
            end
        end, { "i" }
        ),

        },
  sources = {
    { name = "nvim_lsp" },
    { name = 'luasnip' }, -- For vsnip users.
    { name = "buffer", keyword_length = 5 },
    { name = "path" },
  },
}
  -- Set configuration for specific filetype.
  cmp.setup.filetype('py', {
    sources = cmp.config.sources({
      { name = 'nvim_lsp'}, -- You can specify the `cmp_git` source if you were installed it.
    }, {
    { name = "path" },
      { name = 'buffer' },
    { name = 'vsnip' }, -- For vsnip users.
    })
  })
  -- Set configuration for specific filetype.
  cmp.setup.filetype('go', {
    sources = cmp.config.sources({
      { name = 'nvim_lsp'}, -- You can specify the `cmp_git` source if you were installed it.
    }, {
    { name = "path" },
      { name = 'buffer' },
    { name = 'luasnip' }, -- For vsnip users.
    })
  })

  cmp.setup.filetype('tfvars', {
    sources = cmp.config.sources({
      { name = 'nvim_lsp'}, -- You can specify the `cmp_git` source if you were installed it.
    }, {
    { name = "path" },
      { name = 'buffer' },
    { name = 'vsnip' }, -- For vsnip users.
    })
  })
