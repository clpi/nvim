-- REPL KEYMAPS  [ <space>R ] --

local M = {}

M.n = { maps = { name = "+REPL",
  i = { ":IronRepl<CR>", "iron"},
  f = { ":IronFocus<CR>", "iron focus"},
  I = { ":IronReplHere<CR>", "iron here"},
} }

M.v = M.n

return M
