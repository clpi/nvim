-- NOTE: _ (extra maps)
local M = {}

local texec = function(cmd, name)
    return { "<ESC>:TermExec cmd='"..cmd.."'<CR>", name}
end
M.n= { maps = {
    ["<space>"] = { "<ESC>:TermExec cmd='!!'<CR>", "Repeat cmd"},
    ["<CR>"]    = { name = "+move",
	s = {"<C-w>w", "swap windows"},
	r = {"<C-w>r", "rotate windows right"},
	R = {"<C-w>R", "rotate windows left"},
    },
    ["c"]     = { "<C-w>c", "close win"},
    ["<BS>"]  = { "<C-w><C-P>", "last window"},
    ["<TAB>"] = { "<C-w>T", "move to new ws"},
    ["Q"]     = { "<C-w>q", "quit win"},
    ["="]     = { "<C-w>=", "equalize"},
    d         = { "<C-w>h", "hide win"},
    f         = { "<C-w><C-o>", "fullscrn"},
    k         = { "<C-w>k", "move to top"},
    j         = { "<C-w>j", "move to bot"},
    h         = { "<C-w>h", "move to left"},
    l         = { "<C-w>l", "move to right"},
    ["n"]     = { "<C-w>n", "new win"},
    ["_"]     = { "<ESC>:TermExec cmd=''<LEFT>", "Term", },
    ["z"]     = { "<ESC>:Zi<CR>", "Z inter", },
    [","]     = { "<C-w>x", ""},
    ["."]     = { "<C-w>w", ""},
    [">"]     = { "3<C-w><", "width+3"},
    ["<"]     = { "3<C-w><", "width-3"},
    ["-"]     = { "4<c-w>-", "height-4"},
    ["+"]     = { "4<c-w>+", "height+4"},
}, opts = {
    prefix = "q",
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
	prefix = "q",
	mode = "v"
    }
}

return M

