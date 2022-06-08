local map = require("utils").map

-- ",, as prefix"
--
-- map("i", ",,d", "")
--     ["~"] = { ins.relhome.."<space>", "buf rel ~" },
--     ["/"] = { ins.absdir.."<space>", "buf abs dir"},
--     ["<c-d>"] = { ins.date.."<space>"..ins.time.."<space>", "datetime"},
--     ["<c-t>"] = { ins.time.."<space>", "time" },
--     d = { ins.date.."<space>"..ins.time.."<space>", "datetime"},
--     p = { ins.relpath.."<space>", "buf rel path"},
--     P = { ins.absfile.."<space>", "buf rel path"},
--     e = { ins.fileext.."<space>", "buf file ext"},
--     f = { ins.filename.."<space>", "buf filename" },
--     F = { ins.fileroot.."<space>", "buf fileroot"},
--     D = { ins.date.."<space>", "date" },
--     t = { ins.time.."<space>", "time" },
--
