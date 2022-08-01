vim.api.nvim_exec([[ autocmd VimResized * wincmd =	"auto-resize splits when window resized ]], false)
vim.api.nvim_exec([[autocmd BufRead,BufNewfile *.md setlocal spell spelllang=en_gb]], false)
vim.api.nvim_exec([[autocmd BufRead,BufNewfile *.md setlocal spell spelllang=en_gb]], false)
vim.api.nvim_exec([[autocmd FileType * set formatoptions-=cro "stop auto commenting on new line]], false)
vim.api.nvim_exec([[autocmd BufWritePre * %s/\s\+$//e]], false)
vim.api.nvim_exec([[autocmd BufWritePre * %s/\n\+\%$//e]], false)
vim.api.nvim_exec([[autocmd BufWritePre *.[ch] %s/\%$/\r/e]], false)

vim.api.nvim_exec([[

"dynamicaly change cursor depending on mode
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' | silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
]], false)

vim.api.nvim_exec([[ autocmd TermOpen * startinsert ]] , false)


vim.api.nvim_exec([[autocmd filetype python nnoremap <buffer><leader><SPACE> :w<CR> :term python3 "%" <CR>]] , false)

vim.api.nvim_exec([[autocmd filetype go nnoremap <buffer><leader><SPACE> :w<CR> :term go run "%" <CR>]] , false)
