-- NOTE plus
-- NOTE: _ (extra maps)
local M = {}

M.n= { maps = {
}, opts = {
    prefix = "+",
    mode = "n",
    silent = false,
    buffer = nil,
    noremap = true,
    nowait = true,
} }

M.v = {
    maps = {

    },
    opts = {
    prefix = "+",
    mode = "v",
    silent = false,
    buffer = nil,
    noremap = true,
    nowait = true,
    }
}

return M

