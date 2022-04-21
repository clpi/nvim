local M = {}
local pre = "<c-q>"

M.n = {
    maps ={
        q = "<ESC>:qa!<CR>",
        ["<c-q>"] = "<ESC>:qa!<CR>",
    },
    opts = require("keymaps.common").opts.n(pre), 
}
M.v = {
    maps =M.n.maps,
    opts = require("keymaps.common").opts.v(pre),
}
M.i = {
    maps =M.n.maps,
    opts = require("keymaps.common").opts.i(pre), 
}
return M
