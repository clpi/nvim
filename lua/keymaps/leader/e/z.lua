return { name = "+zsh",
  ["<space>"] = { ":e ~/.zshrc<CR>", "zshrc" },
  ["<CR>"] = { ":FzfLua files cwd= ~/.zsh<CR>", "fzf" },
  z = { ":e ~/.zshrc<CR>", "zshrc" },
  c = { ":e ~/.zshrc<CR>", "zshrc" },
  a = { ":e ~/.zsh/alias.zsh<CR>", "alises" },
  e = { ":e ~/.zsh/vars.zsh<CR>", "vars" },
  v = { ":e ~/.zsh/vars.zsh<CR>", "vars" },
  S = { ":e ~/.zsh/secrets.zsh<CR>", "secrets" },
  O = { ":e ~/.zsh/override.zsh<CR>", "override" },
  C = { ":e ~/.zsh/completion.zsh<CR>", "completion" },
  s = { ":e ~/.zsh/opts.zsh<CR>", "exports" },
  o = { ":e ~/.zsh/opts.zsh<CR>", "opts" },
  f = { ":e ~/.zsh/fn.zsh<CR>", "exports" },
  F = { ":e ~/.zsh/fzf.zsh<CR>", "exports" },
  x = { ":e ~/.zsh/scripts.zsh<CR>", "exports" },
  n = { ":e ~/.zshenv<CR>", "env" },
  p = { ":e ~/.zsh/path.zsh<CR>", "path" },
  P = { ":e ~/.zprofile<CR>", "profile" },
  Z = { ":e ~/.zshrc<CR>", "zshrc" },
  m = { ":e ~/.zsh/maps.zsh<CR>", "maps" },
  b = { ":e ~/.zsh/maps.zsh<CR>", "maps" },
}
