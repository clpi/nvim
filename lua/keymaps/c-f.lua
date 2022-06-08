-- NOTE: _ (extra maps)
local M = {}

M.n= { maps = {
    ["<c-f>"] = { ":Telescope file_browser<CR>"},
    ["<c-t>"] = require("keymaps.common").tmpl_fzf(),
    ["<c-space>"] = require("keymaps.common").tmpl_ft_fzf(),
    f = { ":Telescope file_browser theme=dropdown<CR>"},
}, opts = {
    prefix = "<c-f>",
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
    prefix = "<c-f>",
    mode = "v",
    silent = false,
    buffer = nil,
    noremap = true,
    nowait = true,
    }
}

return M

