return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {'rafamadriz/friendly-snippets',
   'L3MON4D3/LuaSnip' },
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      dependencies = {
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
         --require('luasnip.loaders.from_vscode').lazy_load({ paths = { vim.fn.stdpath 'config' .. '/snippets' } })
          -- friendly-snippets - enable standardized comments snippets
        end,
      },
      opts = { history = true, delete_check_events = 'TextChanged' },
    },
  },
  -- use a release tag to download pre-built binaries
  version = '*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = { preset = 'super-tab',
            ['<CR>'] = {'accept', 'fallback'},
        },
    completion = {
    list = { selection = { preselect = false, auto_insert = true } },
    documentation = {
        auto_show = true,
    },
    ghost_text = {
        enabled = true,
    },
        },
    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

        snippets = {
        preset = 'luasnip',
      expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
      active = function(filter)
        if filter and filter.direction then
          return require('luasnip').jumpable(filter.direction)
        end
        return require('luasnip').in_snippet()
      end,
      jump = function(direction) require('luasnip').jump(direction) end,
    },
    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer'},
    providers = {
                lsp = {
                    score_offset = 10,
                },
                buffer = {
                    min_keyword_length = 5
                },
                snippets = {
                    min_keyword_length = 2
                },
            }
    },
  },
  opts_extend = { "sources.default" },
}
