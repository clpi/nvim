-- SERVICES KEYMAPS  [<space>,]  --

local M = {}

M.n = { maps = { name = "+services",
      d = { ":DBUIToggle<CR>", "db"},
      n = { ":NvimTreeToggle<CR>", "tree"},
      t = { ":ToggleTerm<CR>", "term"}
} }

M.v = M.n

return M
