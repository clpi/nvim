local M = {}

local texec = function(cmd, name)
    return { "<ESC>:TermExec cmd='"..cmd.."'<CR>", name}
end

M.n = { maps = {
    ["<CR>"]    = { '<ESC>:TermExec cmd=""<LEFT>' ," prompt"},
    ["<space>"] = { '<ESC>:TermExec cmd=""<LEFT>', "prompt"},
    ["+"]      = { '<ESC>:TermExec cmd=""<LEFT>', "prompt"},
    ["="]      = { '<ESC>:TermExec cmd=""<LEFT>', "prompt"},
    [","]       = {'<ESC>:TermExec cmd=""<LEFT>', "prompt"},
    ["."]       = texec("rake", "default"),
    b = texec("build", "build"),
    B = texec("rake", "default"),
    t = texec("test", "test"),
    x = texec("bench", "bench"),
    r = texec("run", "run"),
    R = texec("run", "run"),
    T = texec("test", "test"),
    X = texec("bench", "bench"),
}, opts = {
    prefix = "=",
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
	prefix = "=",
	mode = "v"
    }
}

return M
