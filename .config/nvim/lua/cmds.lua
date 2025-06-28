vim.loader.enable()
vim.api.nvim_exec([[autocmd VimResized * wincmd =	"auto-resize splits when window resized ]], false)
vim.api.nvim_exec([[autocmd FileType markdown setlocal spell spelllang=en_gb]], false)
vim.api.nvim_exec([[autocmd FileType text setlocal spell spelllang=en_gb]], false)
vim.api.nvim_exec([[autocmd FileType gitcommit setlocal spell spelllang=en_gb]], false)
vim.api.nvim_exec([[autocmd FileType * set formatoptions-=cro "stop auto commenting on new line]], false)
vim.api.nvim_exec([[autocmd BufWritePre * %s/\s\+$//e]], false)
vim.api.nvim_exec([[autocmd BufWritePre * %s/\n\+\%$//e]], false)
vim.api.nvim_exec([[autocmd BufWritePre *.[ch] %s/\%$/\r/e]], false)
vim.api.nvim_exec([[autocmd FileType json set formatprg=jq]], false)


vim.api.nvim_exec([[ autocmd TermOpen * startinsert ]] , false)
vim.api.nvim_exec([[autocmd TermOpen * :set nonumber norelativenumber]], false)


vim.api.nvim_exec([[autocmd filetype python nnoremap <buffer><leader><SPACE> :w<CR> :term python3 "%" <CR>]] , false)
vim.api.nvim_exec([[autocmd filetype javascript nnoremap <buffer><leader><SPACE> :w<CR> :term deno "%" <CR>]] , false)

vim.api.nvim_exec([[autocmd filetype go nnoremap <buffer><leader><SPACE> :! gofmt -w % && go run "%" <CR>]] , false)
vim.api.nvim_exec([[autocmd filetype go nnoremap <buffer><leader>t :w<CR> :! go test <CR>]] , false)

vim.api.nvim_exec([[
  augroup init_calendar
    autocmd!
    autocmd FileType calendar
          \ nnoremap <silent><buffer> <cr>
          \ :<c-u>call wiki#journal#open()<cr>
  augroup END
]] , false)

local function lazy(keys)
    keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
    return function()
        local old = vim.o.lazyredraw
        vim.o.lazyredraw = true
        vim.api.nvim_feedkeys(keys, 'nx', false)
        vim.o.lazyredraw = old
    end
end

vim.keymap.set('n', '<c-d>', lazy('<c-d>zz'), { desc = 'Scroll down half screen' })
vim.keymap.set('n', '<c-u>', lazy('<c-u>zz'), { desc = 'Scroll down half screen' })
vim.cmd([[
cnoreabbrev W! w!
cnoreabbrev W1 w!
cnoreabbrev Q! q!
cnoreabbrev Q1 q!
cnoreabbrev Qa! qa!
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wq1 wq!
cnoreabbrev Wq1 wq!
cnoreabbrev wQ1 wq!
cnoreabbrev WQ1 wq!
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
]])

local goyo_group = vim.api.nvim_create_augroup("GoyoGroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
    desc = "Hide lualine on goyo enter",
    group = goyo_group,
    pattern = "GoyoEnter",
    callback = function()
        require("lualine").hide()
    end,
})
vim.api.nvim_create_autocmd("User", {
    desc = "Show lualine after goyo exit",
    group = goyo_group,
    pattern = "GoyoLeave",
    callback = function()
        require("lualine").hide({ unhide = true })
    end,
})

---vim.cmd 'command! Csoff lua vim.diagnostic.config{virtual_text=false}'
---vim.cmd 'command! Cson lua vim.diagnostic.config{virtual_text=true}'



-- default colorscheme or fallback
vim.g.SCHEME = "gruvbox"

vim.api.nvim_create_autocmd("VimEnter", {
  nested = true,
  callback = function()
    pcall(vim.cmd.colorscheme, vim.g.SCHEME)
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function(params)
    vim.g.SCHEME = params.match
  end,
})
