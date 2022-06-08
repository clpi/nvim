-- NOTE: g (extra maps)
local M = {}
local pre = "g"

local texec   = require("keymaps.common").tprompt
local tprompt = require("keymaps.common").tprompt

M.n= { maps = {
    -- TODO
    -- h = { '<ESC>:Zi<CR>', "zi"},
    -- j = { '<ESC>:Zi<CR>', "zi"},
    j = { '<ESC>:TermExec cmd=""<LEFT>', "term prompt"},
    -- k = { '<ESC>:TermExec cmd=""<LEFT>', "term prompt"},
    -- l = { '<ESC>:TermExec cmd=""<LEFT>', "term prompt"},
    -- --
    -- S = { "<ESC>:"},
    m    = tprompt("just", "just"),
    M    = tprompt("make", "make"),
    J    = tprompt("just", "make"),
    ["<CR>"]    ={"<ESC>:Telescope zoxide list theme=dropdown <CR>", "zoxide"},
    ["<bs>"]    ={"<ESC>:<C-u>e #<CR>", "prev buf"},
    ["<tab>"]    ={"<ESC>:Telescope zoxide list theme=dropdown <CR>", "zoxide"},
    ["<space>"] = tprompt(" ", "prompt"),
    -- ["-"] = { "<ESC>:Telescope zoxide list theme=dropdown<CR>", "Zxodie"}, NOTE: used by lsp
    ["_"] = { '<ESC>:TermExec cmd=" "<LEFT>', "term"},
    [","] = {"<ESC>:bprev<CR>", "buf <"},
    ["."] =  {"<ESC>:bnext<CR>", "buf >"},
    ["/"] = {"<ESC>:SearchBoxReplace<CR>", "replace"},
    ["<"] = { ":bnext<CR>", "buf -"},
    [">"] = { ":bprev<CR>", "buf +"},
    -- b = texec("just build", "j build"),
    -- m = texec("make", "makeault"),
    -- t = texec("just test", "j test"),
    -- x = texec("just bench", "j bench"),
    -- -- r = texec("just run", "j run"),
    -- B = texec("make build", "m build"),
    -- R = texec("make run", "m run"),
    -- T = texec("make test", "m test"),
    -- X = texec("make bench", "m bench"),
    -- j = texec("just", "justault"),
}, opts = require("keymaps.common").opts.n(pre)}
M.v = {
    maps = {

    },
    opts = require("keymaps.common").opts.n(pre)}

return M
