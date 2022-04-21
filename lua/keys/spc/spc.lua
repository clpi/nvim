local utils = require("user.keys.utils")
local cmd = utils.cmd
local tele = utils.tele

lvim.builtin.which_key.mappings["<space>"] = {
  name = "+find",
  h = { "<ESC>:FzfLua oldfiles<CR>", "oldfiles"},
  H = { "<ESC>:FzfLua help_tags<CR>", "help"},
  f = { "<ESC>:FzfLua files<CR>", "files"},
  b = { "<ESC>:FzfLua buffers<CR>"},
  d = { "<ESC>:FzfLua lsp_workspace_diagnostics<CR>"},
  D = { "<ESC>:FzfLua lsp_document_diagnostics<CR>"},
  c = { "<ESC>:FzfLua commands<CR>"},
  ["."] = { "<CMD>FzfLua files cwd=~/.config<CR>"},
  ["~"] = { "<CMD>FzfLua files cwd=~/<CR>"},
  ["`"] = { "<CMD>FzfLua files cwd=~/<CR>"},
  z = { "<CMD>FzfLua files cwd=~/.zsh<CR>"},
  n = { "<CMD>FzfLua files cwd=~/.config/nvim<CR>"},
  v = { "<CMD>FzfLua files cwd=~/.vim<CR>"},
  w = { "<CMD>FzfLua files cwd=~/wiki<CR>"},
  [":"] = { "<ESC>:FzfLua commands<CR>"},
  s = { "<ESC>:FzfLua lsp_workspace_symbols<CR>"},
  S = { "<ESC>:FzfLua lsp_document_symbols<CR>"},
  ["/"] = { "<ESC>:FzfLua live_grep<CR>"},
  g = { "<ESC>:FzfLua live_grep<CR>", "live_grep"},
  G = { "<ESC>:FzfLua live_grep<CR>", "live_grep"},
  ["<CR>"] = { "<ESC>:FzfLua grep_project<CR>"},
  ["<TAB>"] = { "<ESC>:FzfLua<CR>"},
  ["<BS>"] = { "<ESC>:FzfLua resume<CR>"},
  p = { "<CMD>Telescope projects<CR>", "fd proj"},
}
