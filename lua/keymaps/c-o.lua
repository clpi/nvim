local M = {}
local pre = "<c-o>"

M.n = {
    maps =require("keymaps.common.builder").maps("just"),
    opts = require("keymaps.common").opts.n(pre),
}
M.v = {
    maps =require("keymaps.common.builder").maps("just"),
    opts = require("keymaps.common").opts.v(pre),
}
M.i = {
    maps =require("keymaps.common.builder").maps("just"),
    opts = require("keymaps.common").opts.i(pre),
}
return M
