--tTASKS KEYMAPS  (?)  --

local M = {}

M.n = { maps = { name = "+tasks",
      d = { ":DBUIToggle<CR>", "db"},
      n = { ":NvimTreeToggle<CR>", "tree"},
      t = { ":ToggleTerm<CR>", "term"}
} }

M.v = M.n

return M
