-- NOTE: Make keymaps and just keymaps
--
local M = {}


local texec = function(cmd, name)
    return { "<ESC>:TermExec cmd='"..cmd.."'<CR>", name}
end

M.n= { maps = {
    ["-"] = {"<C-w>s", "split h"},
    ["_"] = {"<C-w>v", "split v"},
}, opts = {
    prefix = "S",
    mode = "n",
    silent = false,
    buffer = nil,
    noremap = true,
    nowait = true,
} }

M.v = {
    maps = {
    ["-"] = {"<C-w>s", "split h"},
    ["_"] = {"<C-w>v", "split v"},
    },
    opts = {
    prefix = "S",
    mode = "v",
    silent = false,
    buffer = nil,
    noremap = true,
    nowait = true,
    }
}

return M
