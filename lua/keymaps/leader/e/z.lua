return { name = "+zsh",
  ["<space>"] = { ":e ~/.config/zsh/rc<CR>", "zshrc" },
  ["<CR>"] = { ":FzfLua files cwd= ~/.zsh<CR>", "fzf" },
  z = { ":e ~/.zshrc<CR>", "zshrc" },
  r = { ":e ~/.zshrc<CR>", "zshrc" },
  a = { ":e ~/.config/zsh/alias.zsh<CR>", "alises" },
  e = { ":e ~/.config/zsh/vars.zsh<CR>", "vars" },
  v = { ":e ~/.config/zsh/vars.zsh<CR>", "vars" },
  c = { ":e ~/.config/zsh/colors.zsh<CR>", "secrets" },
  O = { ":e ~/.config/zsh//override.zsh<CR>", "override" },
  C = { ":e ~/.config/zsh//completion.zsh<CR>", "completion" },
  s = { ":e ~/.config/zsh/secrets.zsh<CR>", "exports" },
  S = { ":e ~/.config/zsh/source.zsh<CR>", "exports" },
  o = { ":e ~/.config/zsh/opts.zsh<CR>", "opts" },
  f = { ":e ~/.config/zsh/fn.zsh<CR>", "exports" },
  F = { ":e ~/.config/zsh/fzf.zsh<CR>", "exports" },
  x = { ":e ~/.config/zsh/scripts.zsh<CR>", "exports" },
  n = { ":e ~/.zshenv<CR>", "env" },
  p = { ":e ~/.config/zsh/path.zsh<CR>", "path" },
  P = { ":e ~/.zprofile<CR>", "profile" },
  Z = { ":e ~/.zshrc<CR>", "zshrc" },
  m = { ":e ~/.config/zsh/maps.zsh<CR>", "maps" },
  b = { ":e ~/.config/zsh/maps.zsh<CR>", "maps" },
}
