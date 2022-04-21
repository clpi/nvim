local ins = require("utils").inserts

return {
    ["~"] = { ins.relhome.."<space>", "buf rel ~" },
    ["/"] = { ins.absdir.."<space>", "buf abs dir"},
    d = { ins.date.."<space>", "date" },
    t = { ins.time.."<space>", "time" },
    p = { ins.relpath.."<space>", "buf rel path"},
    P = { ins.absfile.."<space>", "buf rel path"},
    e = { ins.fileext.."<space>", "buf file ext"},
    f = { ins.filename.."<space>", "buf filename" },
    F = { ins.fileroot.."<space>", "buf fileroot"},
}
