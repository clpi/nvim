--! EDIT > CONFIG SETTINGS AND KEYMAPS  [<space>ec] !--
-- TODO Make this in common folder not leader/edit
local M = {}

local cdir = "~/.config/"
local cdir_alt = "~/Library/Application Support/"
local conf = function(rpath, name) return
    { ":e "..cdir..rpath.."<CR>", name }
end
local conf_alt = function(rpath, name) return
    { ":e "..cdir_alt..rpath.."<CR>", name }
end
local ed = function(rpath, name) return
    { ":e ~/"..rpath.."<CR>", name }
end
local tele_op = function(root, op, name) return
    {  ':e '..root..'index.md<CR><ESC>:Telescope '..op..'<CR>', name }
end

M.n = { maps = { name = "+config",
      ["<space>"] = conf("index", "index"),
      ["<BS>"]    = conf_alt("index", "mac index"),
      ["<TAB>"]   = tele_op(cdir, "fd", "fd config"),
      ["<S-TAB>"] = tele_op(cdir_alt, "fd", "fd config"),
      ["<CR>"]    = tele_op(cdir, "find_files", "find config"),
      ["/"]       = tele_op(cdir, "live_grep", "grep config"),
      ["?"]       = tele_op(cdir, "current_buffer_fuzzy_find", "fuzzy find"),
      [","]       = tele_op(cdir, "file_browser", "file browser"),
      ["."]       = tele_op(cdir_alt, "file_browser", "alt config files"),
      a           = conf("alacritty/alacritty.yml"),
      b           = conf("bat/config"),
      c 	  = conf("nu/config.toml", "nushell"),
      g           = ed(".gitconfig"),
      k 	  = conf("kak/kakrc", "kakrc"),
      q 	  = conf('qutebrowser', 'qutebrowser'), --TODO
      m 	  = conf("micro/settings.json", "micro"),
      n 	  = conf("nu/config.toml", "nushell"),
      r 	  = conf('ranger/rc.conf', 'ranger'),
      t 	  = ed('.tmux.conf', 'tmux'),
      y           = conf("youtube-dl/config"),
      z 	  = ed(".zshrc", "zshrc"),
      C 	  = ed(".cargo/config.toml", "cargo"),
      E 	  = ed(".zshenv", "cargo"),
      G 	  = ed(".gitconfig", "git"),
      H 	  = conf("helix/config.toml", "helix"),
      K 	  = conf("kak-lsp/kak-lsp.toml", "kak lsp"),
      M 	  = conf("neomutt/neomuttrc", "neomutt"),
      N 	  = conf("newsboat/urls", "newsboat"),
      D 	  = ed(".doom.d/config.el", 'doom config'),
      S 	  = conf("starship.toml", "starship"),
      V 	  = conf("vifm/vifmrc", "vifm"),
      Z           = conf("zathura/zathurarc"),
} }

M.v = M.n

return M
