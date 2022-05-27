-- GIT KEYMAPS [ <space>g ] --

local M = {}

local ins = require("utils").inserts

M.n = { maps = { name = "+git",
    a = { "<ESC>:TermExec cmd='git add --a'<CR>", 'add all'},
    c = { "<ESC>:TermExec cmd='git commit -m '<LEFT>", 'commit'},
    b = { "<ESC>:TermExec cmd='git checkout -b '<LEFT>", 'branch'},
    r = { "<ESC>:TermExec cmd='git remote add gh git@github.com:clpi/.git'<left><left><left><left><left>", 'remote gh'},
    R = { "<ESC>:TermExec cmd='git remote add gl git@gitlab.com:clpi/.git'<left><left><left><left><left>", 'remote gl'},
    p = { "<ESC>:TermExec cmd='git push gh main'<cr>", 'push gh'},
    P = { "<ESC>:TermExec cmd='git push gl main'<cr>", 'push gl'},
},
    opts = {
        mode = "n",
        prefix = "g",
        buffer = nil,
        silent = false,
        noremap = true,
        nowait = false,
    },
}

M.v = { 
    maps = M.n.maps, 
    opts = {
        mode = "v",
        prefix = "g",
        buffer = nil,
        silent = false,
        noremap = true,
        nowait = false,
}}

return M
