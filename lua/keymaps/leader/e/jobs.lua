--! EDIT > JOBS SETTINGS AND KEYMAPS  [<space>ej] !--
--
local M = {}

local jdir = "~/wiki/jobs/"

local tele_op = function(root, op, name) return
    {  ':e '..root..'index.md<CR><ESC>:Telescope '..op..'<CR>', name }
end
local jobs = function(rpath, name) return
    { ":e "..jdir..rpath..".md<CR>", name}
end

M.n = { maps = { name = "+jobs",
      ["<space>"] = jobs("index", "index"),
      ["<BS>"]    = jobs("index", "index2"),
      ["<TAB>"]   = tele_op(jdir, "fd", "fd files"),
      ["<S-TAB>"] = tele_op(jdir, "fd", "fd files"),
      ["<CR>"]    = tele_op(jdir, "find_files", "find files"),
      ["/"]       = tele_op(jdir, "live_grep", "grep files"),
      ["?"]       = tele_op(jdir, "current_buffer_fuzzy_find", "fuzzy find"),
      [","]       = tele_op(jdir, "file_browser", "file browser"),
      ["."]       = tele_op(jdir, "file_browser", "filebrowse"),
} }

M.v = M.n

return M
