-- NOTE: Make keymaps and just keymaps
--
local M = {}

M.n= {
    maps =require("keymaps.common.builder").maps("just"),
    opts = require("keymaps.common").opts.n("m"),
}

return M
