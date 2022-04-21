-- -- NOTE: _ (extra maps)
-- local M = {}
-- local pre = "<C-s>"
--
-- M.n= { maps = {
--     [pre]={":wa!<CR>"},
--     ["<C-q>"]={":qa!<CR>"},
local pre = "<c-s>"

local M = {}


local ins = require("utils").inserts
M.i = { maps = {
    ["~"] = { ins.relhome.."<space>", "buf rel ~" },
    ["/"] = { ins.absdir.."<space>", "buf abs dir"},
    -- NOTE: markdown flavored date inputs 
    ["<c-d>"] = {'`' .. ins.date.."<space>"..ins.time.."`<space>", "datetime"},
    ["<c-t>"] = {'`' .. ins.time.."`<space>", "time" },
    -- NOTE: non markdown flavored
    d = { ins.date.."<space>"..ins.time.."<space>", "datetime"},
    p = { ins.relpath.."<space>", "buf rel path"},
    P = { ins.absfile.."<space>", "buf rel path"},
    e = { ins.fileext.."<space>", "buf file ext"},
    f = { ins.filename.."<space>", "buf filename" },
    F = { ins.fileroot.."<space>", "buf fileroot"},
    D = { ins.date.."<space>", "date" },
    t = { ins.time.."<space>", "time" },
},
    opts = require("keymaps.common").opts.i(pre),
}

M.n= { maps = {
    ["<c-s>"] = { ":Telescope file_browser<CR>", "tele"},
    ["~"] = { ins.relhome.."<space>", "buf rel ~" },
    ["/"] = { ins.absdir.."<space>", "buf abs dir"},
    ["<c-d>"] = { ins.date.."<space>"..ins.time.."<space>", "datetime"},
    ["<c-t>"] = { ins.time.."<space>", "time" },
    d = { ins.date.."<space>"..ins.time.."<space>", "datetime"},
    t = { ins.time.."<space>", "time" },
    p = { ins.relpath.."<space>", "buf rel path"},
    P = { ins.absfile.."<space>", "buf rel path"},
    e = { ins.fileext.."<space>", "buf file ext"},
    f = { ins.filename.."<space>", "buf filename" },
    F = { ins.fileroot.."<space>", "buf fileroot"},

},
    opts = require("keymaps.common").opts.n(pre),
}

M.v = {
    maps = {
    ["<c-s>"] = { ":Telescope file_browser<CR>", "tele"},
    ["~"] = { ins.relhome.."<space>", "buf rel ~" },
    ["/"] = { ins.absdir.."<space>", "buf abs dir"},
    ["<c-d>"] = { ins.date.."<space>", "date" },
    ["<c-t>"] = { ins.time.."<space>", "time" },
    d = { ins.date.."<space>", "date" },
    t = { ins.time.."<space>", "time" },
    p = { ins.relpath.."<space>", "buf rel path"},
    P = { ins.absfile.."<space>", "buf rel path"},
    e = { ins.fileext.."<space>", "buf file ext"},
    f = { ins.filename.."<space>", "buf filename" },
    F = { ins.fileroot.."<space>", "buf fileroot"},
    },
    opts = require("keymaps.common").opts.v(pre),
}

return M
