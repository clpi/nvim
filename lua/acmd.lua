vim.cmd[[
  autocmd BufEnter,BufWinEnter *.html setlocal ts=2 sw=2 sts=0
  autocmd BufEnter,BufWinEnter *.svelte setlocal ts=2 sw=2 sts=0
  autocmd BufEnter,BufWinEnter *.tsx setlocal ts=2 sw=2 sts=0
  autocmd BufEnter,BufWinEnter *.jsx setlocal ts=2 sw=2 sts=0
  autocmd BufEnter,BufWinEnter *.vue setlocal ts=2 sw=2 sts=0
  autocmd BufEnter,BufWinEnter *.lua setlocal ts=2 sw=2 sts=0
  autocmd BufEnter,BufWinEnter *.json setlocal ts=2 sw=2
  autocmd BufEnter,BufWinEnter *.v setlocal ts=4 sw=4 sts=0 ft=v
  au BufEnter,BufWinEnter *.dart setlocal ts=2 sw=2 sts=0
]]
  -- {
  --   "BufWritePre",
  --   "*",
  --   ":silent lua vim.lsp.buf.formatting_seq_sync()",
  -- },
-- vim.cmd("autocmd BufEnter,BufWinEnter *.md setlocal filetype=markdown syntax=markdown")
-- NOTE: from kickstart.nvim
-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
callback = function()
  vim.highlight.on_yank()
end,
group = highlight_group,
pattern = '*',
})

