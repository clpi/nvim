-- INSERT SETTINGS AND KEYMAPS  [ <space>i ] --

local M = {}

local ins = require("utils").inserts

M.n = { maps = { name = "+insert",
  ["<space>"] = {},
  [";"] = {},
    ["~"] = { ins.relhome.."<space>", "buf rel ~" },
    ["/"] = { ins.absdir.."<space>", "buf abs dir"},
    d = { ins.date.."<space>", "date" },
    t = { ins.time.."<space>", "time" },
    p = { ins.relpath.."<space>", "buf rel path"},
    P = { ins.absfile.."<space>", "buf rel path"},
    e = { ins.fileext.."<space>", "buf file ext"},
    f = { ins.filename.."<space>", "buf filename" },
    F = { ins.fileroot.."<space>", "buf fileroot"},
  D = { "<ESC>0read !date -u"},
} }

M.v = { maps = {
    -- Don't see much use for inserting things in visual mode
} }

return M

--[[
 0 - last yank
 " - unnamed register, last delete or yank
 % - current file name
 # - alternate file name
 * - clipboard contents (X11 primary)
 + - clipboard contents (X11 clipboard)
 / - last search pattern
 : - last command-line
 . - last inserted text
 - - last small (less than a line) delete
 = - expression register
 _ - black hole register
--]]
