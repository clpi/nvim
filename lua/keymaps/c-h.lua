local pre = "<c-h>"

local M = {}

local ut = require("utils")
local ins = ut.inserts


M.n = { maps = {
    ["~"] = { ins.relhome.."<space>", "buf rel ~" },
--     ["/"] = { ins.absdir.."<space>", "buf abs dir"},
--     ["<c-d>"] = { ins.date.."<space>", "date" },
--     ["<c-t>"] = { ins.time.."<space>", "time" },
--     p = { ins.relpath.."<space>", "buf rel path"},
--     P = { ins.absfile.."<space>", "buf rel path"},
--     e = { ins.fileext.."<space>", "buf file ext"},
--     f = { ins.filename.."<space>", "buf filename" },
--     F = { ins.fileroot.."<space>", "buf fileroot"},
--     d = { ins.date.."<space>", "date" },
--     t = { ins.time.."<space>", "time" },
--     p = { ins.relpath.."<space>", "buf rel path"},
--     P = { ins.absfile.."<space>", "buf rel path"},
--     e = { ins.fileext.."<space>", "buf file ext"},
--     f = { ins.filename.."<space>", "buf filename" },
--     F = { ins.fileroot.."<space>", "buf fileroot"},
},
    opts = require("keymaps.common").opts.n(pre),
}

M.v = {
    maps =M.n.maps,
    opts = require("keymaps.common").opts.v(pre),
}
M.i = {
    maps =M.n.maps,
    opts = require("keymaps.common").opts.i(pre), 
}


return M

