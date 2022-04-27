--! EDIT > INFRA SETTINGS AND KEYMAPS  [<space>ei] !--

local M = {}

local idir = "~/wiki/dev/infra/"

local infra = function(rpath, name) return
    { ":e "..idir..rpath..".md<CR>", name}
end
local tele_op = function(root, op, name) return
    {  ':e '..root..'index.md<CR><ESC>:Telescope '..op..'<CR>', name }
end

--- NOTE: For infrastructure definition and info files
M.n = { maps = { name = "+infra",
      ["<space>"] = infra("index", "index"),
      ["<TAB>"]   = tele_op(idir, "fd", "fd infra"),
      ["<CR>"]    = tele_op(idir, "find_files", "find infra"),
      ["/"]       = tele_op(idir, "live_grep", "grep infra"),
      ["?"]       = tele_op(idir, "current_buffer_fuzzy_find", "fuzzy find"),
      ["-"]       = tele_op(idir, "file_browser", "file browser"), -- TODO
      [","]       = tele_op(idir, "file_browser", "file browser"),
      ["."]       = tele_op(idir, "file_browser", "file browser"), -- TODO
      d   	  = infra("docker/index", "docker"),
      p 	  = infra("podman/index", "podman"),
      v 	  = infra("vagrant/index", "vagrant"),
      a           = infra("ansible/index", "ansible"),
      k           = infra("kube/index", "kubernetes"),
      t           = infra("terraform/index", "terraform")
} }

M.v = M.n

return M
