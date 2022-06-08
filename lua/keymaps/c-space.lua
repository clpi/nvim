-- NOTE: _ (extra maps},
local M = {}
local pre = "<c-space>"
--
M.n= {
    maps = { name = "gen",
       ["<c-space>"] = {"<ESC>:", "e"},
    },

    opts = {

    }
}

M.v = {
    maps = M.n.maps,
    opts = require("keymaps.common").opts.v(pre),
}
return M
-- vim.cmd[[nnoremap <c-space><c-space> <ESC>:TermExec cmd="just run"<CR>]]

