return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    local lspkind = require('lspkind')
    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
              snippet = {
    expand = function(args)
    require('luasnip').lsp_expand(args.body)
    end,

  },

mapping_cmd = cmp.mapping.preset.cmdline({
  ['<CR>'] = {
    c = function(default)
      if cmp.visible() then
        return cmp.confirm({ select = true })
      end

      default()
    end,
  },
}),
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })),
        ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] =cmp.mapping.confirm({ select = true, behavior = cmp.SelectBehavior.Insert }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
     --["<CR>"] = cmp.mapping({
     --  i = function(fallback)
     --    if cmp.visible() and cmp.get_active_entry() then
     --      cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
     --    else
     --      fallback()
     --    end
     --  end,
     --  s = cmp.mapping.confirm({ select = true }),
     --  c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
     --}),
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip", keyword_length = 3},
        { name = "buffer", keyword_length = 5 },
        { name = "path" },
      }),
      formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                     -- can also be a function to dynamically calculate max width such as
                     -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default
             }),
            },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    },
              cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' },
            },
          },
        }),
      })
        end,
  ---@param opts cmp.ConfigSchema
  config = function(_, opts)
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end
    require("cmp").setup(opts)
  end,

}
