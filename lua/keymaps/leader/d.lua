-- DEBUG SETTINGS AND KEYMAPS  [ <space>d ] --

local M = {}

M.n = { maps = { name = "+debug",
    r = { ":ReplToggle<CR>", "repl toggle"},
    u = { ":DapUiToggle<CR>", "ui toggle"},
    f = { ":DapUiFloat<CR>", "ui float"},
    L = { ":DIList<CR>", "list"},
    I = { ":DIInstall<space>", "install"},
    U = { ":DIUninstall<space>", "uninstall"},
    S = { ":DapStop<CR>", "stop"},
    R = { ":DapRerun<CR>", "stop"},
} }

M.v = M.n
-- local function map(m, l, r, o)
--   local op = {noremap = true}
--   if o then
--     op = vim.tbl_extend("force", op, o)
--   end
--   vim.api.nvim_buf_set_keymap(m, l, r, op)
-- end
-- map("n", "<leader>Ds", '<cmd>lua require"metals".hover_worksheet()<CR>')
-- map("n", "<leader>Da", [[<cmd>lua vim.diagnostic.setqflist()<CR>]]) -- all workspace diagnostics
-- map("n", "<leader>De", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]]) -- all workspace errors
-- map("n", "<leader>Dw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]]) -- all workspace warnings
-- map("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- buffer diagnostics only
-- map("n", "<leader>dc", [[<cmd>lua require"dap".continue()<CR>]])
-- map("n", "<leader>dr", [[<cmd>lua require"dap".repl.toggle()<CR>]])
-- map("n", "<leader>dK", [[<cmd>lua require"dap.ui.widgets".hover()<CR>]])
-- map("n", "<leader>dt", [[<cmd>lua require"dap".toggle_breakpoint()<CR>]])
-- map("n", "<leader>dso", [[<cmd>lua require"dap".step_over()<CR>]])
-- map("n", "<leader>dsi", [[<cmd>lua require"dap".step_into()<CR>]])
-- map("n", "<leader>dl", [[<cmd>lua require"dap".run_last()<CR>]])
--
return M
