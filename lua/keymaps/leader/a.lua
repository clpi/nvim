local M = {}

M.n = { 
    maps = {  name = "+aerial",
        a = { "<ESC>:<C-u>AerialToggle<CR>", "aerial<CR>"},
        A = { "<ESC>:<C-u>AerialTreeToggle<CR>", "tree aerial<CR>"},
        ["<space>"] = {"<CMD>AerialToggle!<CR>", "toggle<CR>"},
        t = {"<CMD>AerialTreeToggle!<CR>"},
        o = {"<CMD>AerialTreeOpen<CR>"},
        O = {"<CMD>AerialTreeOpenAll<CR>"},
        c = {"<CMD>AerialTreeClose<CR>"},
        C = {"<CMD>AerialTreeCloseAll<CR>"},
        n = {"<CMD>AerialNext<CR>"},
        p = {"<CMD>AerialPrev<CR>"},
        f = {"<CMD>call aerial#fzf()<CR>", "aerial fzf<CR>"},
        ["/"] = {"<CMD>call aerial#fzf()<CR>", "aerial fzf<CR>"},
        ["."] = {"<CMD>AerialNextUp<CR>"},
        [","] = {"<CMD>AerialPrevUp<CR>"},
        ["<CR>"] = {"<CMD>AerialGo<CR>"},
    } 
}

M.v = M.n



return M
