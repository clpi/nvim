-- WINDOW RESIZE KEYMAPS  [ <space>r ] --

local M = {}

M.n = { maps = { name = "+resize",
    h = { '5<C-w><', "width -5"},
    l = { '5<C-w>>', "width +5"},
    j = { '5<C-w>-', "height -5"},
    k = { '5<C-w>+', "height +5"},
    H = { '10<C-w><', "width -10"},
    L = { '10<C-w>>', "width +10"},
    J = { '10<C-w>-', "height -10"},
    K = { '10<C-w>+', "height +10"},
} }

M.v = M.n

return M
