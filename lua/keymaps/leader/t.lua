-- TOGGLE SETTINGS AND KEYMAPS  [ <space>t ] --

local M = {}

M.n = { maps = { name = "+toggle",
  ["/"] = {  ':TroubleToggle telescope<CR>', "diagnostics"},
  ["?"] = {  ':TroubleToggle workspace_diagnostics<CR>', "diagnostics"},
  ["<BS>"] = {  ':TroubleClose<CR>', "diagnostics"},
  ["<TAB>"] = {  ':TroubleToggle<CR>', "toggle"},
  ["<CR>"] = {  ':TroubleToggle<CR>', "toggle"},
  [";"] = { ':TroubleRefresh<CR>', "refresh"},
  ["-"] = { ':TroubleRefresh<CR>', "refresh"},
  ["="] = { ':TroubleRefresh<CR>', "refresh"},
  d = { ':TroubleToggle document_diagnostics<CR>', "doc diagnostics"},
  c = { ':TroubleClose<CR>', "close"},
  o = { ':TroubleOpen<CR>', "open"},
  R = { ':TroubleRefresh<CR>', "refresh"},
  q = { ':TroubleToggle quickfix<CR>', "qf"},
  l = { ':TroubleToggle loclist<CR>', "loclist"},
  i = { ':TroubleToggle lsp_implementations<CR>', "impls"},
  r = { ':TroubleToggle lsp_references<CR>', "refs"},
  D = { ':TroubleToggle workspace_diagnostics<CR>', "diagnostics"},
  f = { ':TroubleToggle lsp_definitions<CR>', "defs"},
  y = { ':TroubleToggle lsp_type_definitions', "typedefs"},
  t = { '<cmd>TroubleToggle<CR>', "toggle"},
  w = {  ':TroubleToggle workspace_diagnostics<CR>', "proj diagnostics"},
  -- T = { "<Cmd>TroubleToggle<CR>", "term all"},
} }

M.v = M.n

return M
