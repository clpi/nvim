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

return M
