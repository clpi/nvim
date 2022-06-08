--! EDIT > BOILERPLATE SETTINGS AND KEYMAPS  [<space>eb] !--

local M = {}

local bdir = "~/wiki/dev/boilerplate/"

local tele_op = function(root, op, name) return
    {  ':e '..root..'index.md<CR><ESC>:Telescope '..op..'<CR>', name }
end
local bplate = function(rpath, name) return
    { ":e "..bdir..rpath..".md<CR>", name}
end

M.n = { maps = { name = "+boilerplate",
      ["<space>"] = bplate("index", "index"),
      ["<TAB>"]   = tele_op(bdir, "fd", "fd infra"),
      ["<CR>"]    = tele_op(bdir, "find_files", "find templates"),
      ["/"]       = tele_op(bdir, "live_grep", "grep templates"),
      ["?"]       = tele_op(bdir, "current_buffer_fuzzy_find", "fuzzy find"),
      ["-"]       = tele_op(bdir, "file_browser", "file templates"), --TODO
      [","]       = tele_op(bdir, "file_browser", "file templates"),
      ["."]       = tele_op(bdir, "file_browser", "file templates"), -- TODO
} }

M.v = M.n

return M
