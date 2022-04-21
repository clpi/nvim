-- SEARCH SETTINGS AND KEYMAPS  [ <space>s ] --

local M = {}

M.n = { maps = { name = "+term",
    ["<space>"] = { ":TermExec cmd=''<LEFT>", "exec prompt"},
    ["_"] = { ":ToggleTerm<CR>", "toggle"},
    ["-"] = { ":ToggleTermToggleAll<CR>", "toggle all"},
    l = { ":TermExec cmd='ls'", "exec ls"},
} }

M.v = M.n

return M
