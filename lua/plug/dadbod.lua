vim.cmd[[
  autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni

  autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
]]

vim.g.vim_dadbod_completion_mark = "DB!"
