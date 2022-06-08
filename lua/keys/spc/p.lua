lvim.builtin.which_key.mappings.p = { name = "+workspace",
  p = { "<CMD>Telescope projects<CR>", "fd proj"},
  ["<TAB>"] = { ":tabnext<CR>", "next" },
  ["<S-TAB>"] = { ":tabprevious<CR>", "prev" },
  ["="] = { ":tabs<CR>", "show" },
  n = { ":tabnew<CR>", "new" },
  c = { ":tabnew<CR>", "create" },
  d = { ":tabclose<CR>", "close" },
  O = { ":tabonly<CR>", "only" },
  ["<tab>"] = { ":tabs<CR>", "show" },
  ["{"] = { ":tabfirst<CR>", "first" },
  ["}"] = { ":tablast<CR>", "last" },
  ["]"] = { ":tabnext<CR>", "next" },
  ["["] = { ":tabprevious<CR>", "prev" },
  ["."] = { ":tabnext<CR>", "next" },
  [","] = { ":tabprevious<CR>", "prev" },
  ["1"] = { ":tabn 1<CR>", "ws 1" },
  ["2"] = { ":tabn 2<CR>", "ws 2" },
  ["3"] = { ":tabn 3<CR>", "ws 3" },
  ["4"] = { ":tabn 4<CR>", "ws 4" },
  ["5"] = { ":tabn 5<CR>", "ws 5" },
  ["6"] = { ":tabn 6<CR>", "ws 6" },
  ["7"] = { ":tabn 7<CR>", "ws 7" },
  ["8"] = { ":tabn 8<CR>", "ws 8" },
}
