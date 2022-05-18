--! EDIT > PROJECTS SETTINGS AND KEYMAPS  [<space>ep] !--
--! NOTE: These mappings go to project *data* and metadata
--! 	  for going to the proejcts themselves, the
--!       <space>p or <C-P> keybindings are reserved
local M = {}

local pdir = "~/wiki/proj/"
local projects = function(rpath, name) return
    { ":e "..pdir..rpath..".md<CR>", name}
end
local tele_op = function(root, op, name) return
    {  ':e '..root..'index.md<CR><ESC>:Telescope '..op..'<CR>', name }
end


M.n = { maps = { name = "+projects",
      ["<space>"] = projects("index", "index"),
      ["<BS>"]    = projects("index", "index2"),
      ["<TAB>"]   = tele_op(pdir, "fd", "fd proj"),
      ["<S-TAB>"] = tele_op(pdir, "fd", "fd proj"),
      ["<CR>"]    = tele_op(pdir, "find_files", "find proj"),
      ["/"]       = tele_op(pdir, "live_grep", "grep proj"),
      ["?"]       = tele_op(pdir, "current_buffer_fuzzy_find", "fuzzy find"),
      [","]       = tele_op(pdir, "file_browser", "file browser"),
      ["."]       = tele_op(pdir, "file_browser", "proj files"),
} }

M.v = M.n

return M
