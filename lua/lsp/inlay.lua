-- require'lsp_extensions'.inlay_hints{
-- 	highlight = "Comment",
-- 	prefix = " > ",
-- 	aligned = false,
-- 	only_current_line = false,
-- 	enabled = { "ChainingHint" }
-- }
-- vim.cmd("nnoremap <space>ti :lua require'lsp_extensions'.inlay_hints()")
-- vim.cmd("nnoremap <space>tI :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }")

-- vim.cmd[[autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}]]
-- vim.cmd[[autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }]]
-- -- vim.cmd[[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"ChainingHint"} }]]
