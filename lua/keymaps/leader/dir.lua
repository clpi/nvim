-- DIR SETTINGS AND KEYMAPS  [ <space>- ] --

local M = {}

M.n = { maps = { name = "+dir",
    r = { ":NvimTreeRefresh<CR>", "refresh tree"},
    ["<space>"] = { ":NvimTreeFocus<CR>", "focus tree"},
    ["-"] = { ":NvimTreeToggle<CR>", "tree"},
    ["/"] = { ":Telescope find_files<CR>", "files"},
    ["\\"] = { ":Telescope fd<CR>", "fd"},
    ["="] = { ":Telescope file_browser<CR>", "telescope fb"},
} }

M.v = M.n

return M
