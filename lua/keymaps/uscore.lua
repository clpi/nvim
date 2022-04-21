-- NOTE: _ (extra maps)
local M = {}

local texec = require("keymaps.common").texec
M.n= { maps = {
    -- ["<space>"] = { "<ESC>:TermExec cmd='!!'<CR>", "Repeat cmd"},
    -- ["<CR>"]    = { '<ESC>:TermExec cmd="make test %%"<cr>', "make"},
    -- ["<TAB>"] = {"<ESC>:ToggleTerm<CR>", "toggle"},
    -- ["z"] = { "<ESC>:Zi<CR>", "Z inter", },
    -- [","] = texec("just", "just default"),
    -- ["."] = texec("make", "make default"),
    -- b = texec("just build", "j build"),
    -- m = texec("make", "make default"),
    -- ["-"] = texec("make", "make default"),
    ["_"] = { "<ESC>:TermExec cmd=''<LEFT>", "Term", },
    ["-"] = { "<ESC>:TermExec cmd=''<LEFT>", "Term", },
    ["<space>"] = { "<ESC>:TermExec cmd=''<LEFT>", "Term", },
    ["<cr>"] = { "<ESC>:TermExec cmd=''<LEFT>", "Term", },
    ["<tab>"] = { "<ESC>:TermExec cmd=''<LEFT>", "Term", },
    ["<bs>"] = { "<ESC>:TermExec cmd=''<LEFT>", "Term", },
    q = {"<ESC><C-w>ji<C-c><ESC><ESC><C-w>k", "SIGINT"},
    -- c = texec("")
    z = { "Zi<CR>", "zi", },
    t = {"<ESC>:Telescope ", "tele prompt" },
    -- T = {"<ESC>:Telescope   theme=dropdown<S-LEFT><LEFT>", "tele prompt" },
    x = texec("just bench", "j bench"),
    r = texec("just run", "j run"),
    B = texec("make build", "m build"),
    R = texec("make run", "m run"),
    T = texec("make test", "m test"),
    X = texec("make bench", "m bench"),
    j = texec("just", "just default"),
}, opts = {
    prefix = "_",
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
	prefix = "_",
	mode = "v"
    }
}

return M
