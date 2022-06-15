local M = {}

M.n = { 
  maps = { 
    name = "+aerial",
    ["<space>"] = "AerialToggle!",
    t = "AerialTreeToggle!",
    o = "AerialTreeOpen",
    O = "AerialTreeOpenAll",
    c = "AerialTreeClose",
    C = "AerialTreeCloseAll",
    a = "AerialToggle!",
    n = "AerialNext",
    p = "AerialPrev",
    f = { "<CMD>call aerial#fzf()<CR>", "Fzf" },
    ["."] = "AerialNextUp",
    [","] = "AerialPrevUp",
    ["<CR>"] = "AerialGo",
  },
  opts = {
    mode = "n",
    noremap = true,
    silent = true,
    nowait = true,
    prefix = "a"
  }
}

M.v = M.n

M.v.opts.mode = "v"

return M
