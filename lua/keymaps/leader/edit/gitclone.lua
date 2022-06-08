--! EDIT > GIT TEMPLATE SETTINGS AND KEYMAPS  [<space>et] !--
local M = {}

local gcdir = "~/tmpl/"
local tele_op = function(root, op, name) return
    {  ':e '..root..'index.md<CR><ESC>:Telescope '..op..'<CR>', name }
end
local tmpl = function(rpath, name) return
    { ":e "..gcdir..rpath..".md<CR>", name}
end
M.n = { maps = { name = "+tmpl",
      ["<space>"] = tmpl("index", "index"),
      ["<BS>"]    = tmpl("index", "index2"),
      ["<TAB>"]   = tele_op(gcdir, "fd", "fd templates"),
      ["<S-TAB>"] = tele_op(gcdir, "fd", "fd templates"),
      ["<CR>"]    = tele_op(gcdir, "find_files", "find templates"),
      ["/"]       = tele_op(gcdir, "live_grep", "grep templates"),
      ["?"]       = tele_op(gcdir, "current_buffer_fuzzy_find", "fuzzy find"),
      [","]       = tele_op(gcdir, "file_browser", "file browser"),
      ["."]       = tele_op(gcdir, "file_browser", "template files"),
} }
M.v = M.n

return M
