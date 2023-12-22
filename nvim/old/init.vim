"    init.vim rmcle
"==============================================================================
""""""""""" Vim Plug Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-obsession'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'mtdl9/vim-log-highlighting'
Plug 'chrisbra/csv.vim'
Plug 'lervag/wiki.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'neovim/nvim-lspconfig'
Plug 'rafamadriz/friendly-snippets'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'psf/black'
call plug#end()


""""""""""" basic setup
syntax on
set mouse=nv
set nocompatible              " required
set completeopt=menu,menuone,noselect
set timeoutlen=1000 ttimeoutlen=0	"set timeout to improve speed for ESC key
set splitright
set hidden	"hides buffers instead of closing them. should be a default
let g:netrw_winsize=30	"set file explorer window size
"Search settings
set hlsearch            " highlight matches
set incsearch           " search as characters are entered
set ignorecase
set shortmess-=S
"wild menu and show commands
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set laststatus=2
"colorscheme
set background=dark
set visualbell
colorscheme gruvbox
""""""""""auto commands
autocmd VimResized * wincmd =	"auto-resize splits when window resized
autocmd BufRead,BufNewfile *.md setlocal spell spelllang=en_gb
autocmd FileType * set formatoptions-=cro "stop auto commenting on new line
" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
"dynamicaly change cursor depending on mode
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' | silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
" default insert mode when opening terminal
autocmd TermOpen * startinsert
""""""""""" Plugin conf
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:mkdp_refresh_slow=1
let g:mkdp_preview_options = {'disable_filename': 1}
let g:wiki_root = '~/Rsync/wiki'
let g:wiki_link_target_type='md'
let g:wiki_filetypes=['md']
let g:wiki_write_on_nav=1
let g:wiki_mappings_use_defaults= 'local'
let g:gruvbox_guisp_fallback='bg'
""""""""""""remaps
let mapleader = ","
nnoremap Y yg_
nnoremap <leader>ff :Telesscope fd
nnoremap <leader>fw :Telescope fd cwd=~/Rsync/wiki <cr>
nnoremap <leader>fg :Telescope live_grep
nnoremap <leader>fb :Telescope buffers <cr>
autocmd filetype python nnoremap <buffer><leader><SPACE> :w<CR> :term python3 "%" <CR>
autocmd filetype go nnoremap <buffer><leader><SPACE> :w<CR> :term go run "%" <CR>
nnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap <leader>y "+y
tnoremap jk <C-\><C-n>
inoremap jk <Esc>
"splits and buffers
set splitbelow
nnoremap <leader>l <C-W><C-L>
tnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
tnoremap <leader>h <C-W><C-H>
tnoremap <Esc> <C-\><C-n>
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
" Jump forward or backward through snippets
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
"harpoon
nnoremap <leader>a :lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>s :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<cr>

lua << EOF
-- lua for lsp and cmp
local cmp = require "cmp"
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = 'vsnip' }, -- For vsnip users.
    { name = "buffer", keyword_length = 5 },
    { name = "path" },
  },
}
  -- Set configuration for specific filetype.
  cmp.setup.filetype('py', {
    sources = cmp.config.sources({
      { name = 'nvim_lsp'}, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    { name = 'vsnip' }, -- For vsnip users.
    })
  })
  -- Set configuration for specific filetype.
  cmp.setup.filetype('go', {
    sources = cmp.config.sources({
      { name = 'nvim_lsp'}, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    { name = 'vsnip' }, -- For vsnip users.
    })
  })
-- Mappings.
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- Use an on_attach function to only map the following keys after the lsp attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end
-- cmp lua
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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
      experimentalPostfixCompletions = true,
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
-- treesitter lua
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python", "vim", "lua", "json", "markdown", "toml", "bash", "html", "dockerfile", "css", "yaml", "regex", "go" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    additional_vim_regex_highlighting = false,
  },
}

require('telescope').setup{}
M = {}
function M.wiki_search()
  require('telescope.builtin').find_files {
    winblend = 5,
    border = true,
    cwd = vim.fn.stdpath('data') .. '~/Rsync/wiki/'
  }
end

EOF
