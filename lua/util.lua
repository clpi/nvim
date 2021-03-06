local M = {}

M.vi = {}

M.basedir = "~/.config/lvim/"
M.userdir = M.basedir .. "lua/user/"

M.dirs = {
  user = M.basedir .. "lua/user/",
  colors = M.userdir .. "colors/",
  plug = M.userdir .. "plug/",
  lsp = M.userdir .. "lsp/",
  keys ={
    base = M.userdir .. "keys/",
    spc =  M.userdir .. "keys/spc/",
    comma = M.userdir .. "keys/comma/",
  } ,
}
-- @params @dir: string @name sring
M.edit = function(dir, file)
  if dir ~= nil and file ~= nil then
    return { "<ESC>e"..dir..file.."<CR>", file}
  end
end

M.cmdmap = function(cmd, input, args, name)
  local a = ""
  local i = ""
  local n = ""
  if input ~= nil then i = input end
  if args ~= nil then a = args end
  if name ~= nil then n = name
  elseif input ~= nil then n = input
  else n = cmd end
  return { "<CMD>"..cmd.." "..i.." "..a.."<CR>", n}
end

M.teleescope = function(command, args)
  return M.cmdmap("Telescope", command, args, command)
end
M.fzf = function(command, args)
  return M.cmdmap("FzfLua", command, args, command)
end
M.fzfat = function(dir)
  return M.fzf("files", "cwd="..dir)
end

M.bmap = function(bufnr, mode, key, cmd, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, key, cmd, opts)
end

M.mmap = function(mode, key, cmd, opts)
    vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

-- NOTE: Unimplemented
M.wkmap = function(mode, prefix, keys, mopts)
  local wk = require("which-key")
  local kmaps , op = {}, {
    mode = mode,
    prefix = prefix,
    noremap = mopts.noremap,
    silent = mopts.silent,
    nowait = mopts.nowait,
  }
  if keys ~= nil then kmaps = keys end
  wk.register(kmaps, op)
end

M.map = {
  b = {
    i = function(b, k, c, o) return M.bmap(b, "i",  k, c, o) end,
    n = function(b, k, c, o) return M.bmap(b, "n",  k, c, o) end,
    v = function(b, k, c, o) return M.bmap(b, "v",  k, c, o) end,
  },
  wk = {
    i = function(p, k, o) return M.wkmap("i", p, k, o) end,
    n = function(p, k, o) return M.wkmap("n", p, k, o) end,
    v = function(p, k, o) return M.wkmap("v", p, k, o) end,
  },
  c  = function(key, cmd, opts) return M.mmap("c", key, cmd, opts) end,
  v  = function(key, cmd, opts) return M.mmap("v", key, cmd, opts) end,
  n  = function(key, cmd, opts) return M.mmap("n", key, cmd, opts) end,
  i  = function(key, cmd, opts) return M.mmap("i", key, cmd, opts) end,
  r  = function(key, cmd, opts) return M.mmap("r", key, cmd, opts) end,
}
M.ccol = function() return vim.fn.col('.') end
-- M.crow = function() return vim.fn.getline()

M.inserts = {
    abspath2 = "<C-r>=expand('%l')",
    date     = "<C-R>=strftime('%m/%d/%y')<CR>",
    time     = "<C-R>=strftime('%H:%M')<CR>",
    dtime     = "<C-R>=strftime('%c')<CR>",
    relpath  = "<C-R>%<CR>",  -- relative to pwd
    relhome  = "<C-R>=expand('%:~')<CR>",
    fileroot = "<C-R>=expand('%:r')<CR>",
    fileext  = "<C-R>=expand('%:e')<CR>",
    filename = "<C-R>=expand('%:t')<CR>",
    absfile  = "<C-R>=expand('%:p')<CR>",
    absdir   = "<C-R>=expand('%:p:h')<CR>",
}

M.vi.text = {
  n = "NORMAL",
  no = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "V-LINE",
  -- [""] = "V-BLOCK",
  c = "COMMAND",
  cv = "COMMAND",
  ce = "COMMAND",
  R = "REPLACE",
  Rv = "REPLACE",
  s = "SELECT",
  S = "SELECT",
  [""] = "SELECT",
  t = "TERMINAL",
}

M.vi.colors = {
  n = "String",
  no = "String",
  i = "Float",
  v = "Statement",
  V = "Statement",
  -- [""] = "ViStatement",
  R = "WarningMsg",
  Rv = "WarningMsg",
  r = "Operator",
  rm = "Operator",
  s = "Operator",
  S = "Operator",
  [""] = "Operator",
  c = "Operator",
  ["!"] = "Operator",
  t = "Operator",
}

M.vi.sep = {
  n = "String",
  no = "String",
  i = "StatusBg",
  v = "Statement",
  V = "Statement",
 [""] = "Statement",
  R = "Float",
  Rv = "Float",
  r = "Operator",
  rm = "Operator",
  s = "Statement",
  S = "Statement",
  -- [""] = "FelnStatement",
  c = "Float",
  ["!"] = "Operator",
  t = "Operator",
}

M.icons = {
  locker = "???", -- #f023
  page = "???", -- 2630
  line_number = "???", -- e0a1
  connected = "???", -- f817
  dos = "???", -- e70f
  unix = "???", -- f17c
  mac = "???", -- f179
  mathematical_L = "????",
  vertical_bar = "???",
  vertical_bar_thin = "???",
  left = "???",
  right = "???",
  block = "???",
  left_filled = "???",
  right_filled = "???",
  slant_left = "???",
  slant_left_thin = "???",
  slant_right = "???",
  slant_right_thin = "???",
  slant_left_2 = "???",
  slant_left_2_thin = "???",
  slant_right_2 = "???",
  slant_right_2_thin = "???",
  left_rounded = "???",
  left_rounded_thin = "???",
  right_rounded = "???",
  right_rounded_thin = "???",
  circle = "???",
}

M.icon_etc = {
  CLASS = "???",
  CLASS_TYPE_ALIAS = "???",
  COMPILATION_UNIT = "???",
  CONSTRUCTOR = "???",
  CONSTRUCTOR_INVOCATION = "???",
  ENUM = "???",
  ENUM_CONSTANT = "???",
  EXTENSION = "???",
  FIELD = "???",
  FILE = "???",
  FUNCTION = "???",
  FUNCTION_INVOCATION = "??????",
  FUNCTION_TYPE_ALIAS = "??????",
  GETTER = "???",
  LABEL = "???",
  LIBRARY = "???",
  LOCAL_VARIABLE = "???",
  METHOD = "???",
  MIXIN = "???",
  PARAMETER = "???",
  PREFIX = "???",
  SETTER = "???",
  TOP_LEVEL_VARIABLE = "???",
  TYPE_PARAMETER = "???",
  UNIT_TEST_GROUP = "???",
  UNIT_TEST_TEST = "???",
  UNKNOWN = "???",
}

M.src_icons = {
  buffer                   = "???",
  calc                     = "???",
  luasnip                  = "???",
  nvim_lsp                 = "???",
  path                     = "???",
  vsnip                    = "???",
  crates                   = "???",
  dadbod                   = "???", -- ???
  nvim_lua                 = "???",
  orgmode                  = "???",
  neorg                    = "???",
  treesitter               = "???",
  copilot                  = "???",
  nvim_lsp_signature_help  = "???", -- ???
  nvim_lsp_document_symbol = "???",
  vimwiki_tags             = "???", -- ???  ???
  cmp_git                  = "???",
  latex_symbols            = "???",
  cmdline                  = "???", -- ???
  npm                      = "???",
  cmdline_history          = "???",
  cmp_tabnine              = "???", -- ???
  emoji                    = "???",
}
M.source_names = {
  buffer                   = "??? Bu",
  calc                     = "??? Ca",
  emoji                    = "??? Em",
  luasnip                  = "??? Sn",
  nvim_lsp                 = "??? Ls",
  path                     = "??? Pa",
  vsnip                    = "??? Vs",
  crates                   = "??? Cr",
  dadbod                   = "??? Db",
  nvim_lua                 = "??? Lu",
  orgmode                  = "??? Or",
  neorg                    = "??? Ne",
  treesitter               = "???Ts",
  copilot                  = "??? Co",
  nvim_lsp_signature_help  = "??? Sh", -- ???  ???
  nvim_lsp_document_symbol = "??? Ds", -- ???
  vimwiki_tags             = "??? VW", -- ???  ???
  cmp_git                  = "??? Gi",
  latex_symbols            = "??? La",
  cmdline                  = "??? Cm", -- ???
  npm                      = "??? Np",
  cmdline_history          = "??? Ch",
  cmp_tabnine              = "??? Tn", -- ???
}
--??? ???
M.kind_icons = {
  Text          = "??? ",
  Method        = "??? ",
  Function      = "??? ",
  Constructor   = "??? ",
  Field         = "??? ",
  Namespace     = "??? ",
  Variable      = "??? ",
  Class         = "??? ",
  Interface     = "??? ",
  Module        = "??? ",
  Property      = "??? ",
  Unit          = "??? ",
  Value         = "??? ",
  Enum          = "???",
  Keyword       = "??? ", -- 
  Snippet       = "??? ",
  Color         = "??? ",
  File          = "??? ",
  Object        = "??? ",
  Key           = "??? ",
  Package       = "??? ",
  Null          = "??? ",
  Reference     = "??? ",
  Folder        = "??? ",
  Constant      = "??? ",
  Struct        = "??? ",
  Event         = "??? ",
  Array         = "??? ",
  Operator      = "??? ",
  EnumMember    = "??? ",
  TypeParameter = "??? ",
  Directory     = "??? ", -- ???
  Tag           = "??? ",
}
M.alticons = {
  Class = "??? ",
  Color = "??? ",
  Constant = "??? ",
  Constructor = "??? ",
  Enum = "??? ",
  EnumMember = "??? ",
  Field = "??? ",
  File = "??? ",
  Folder = "??? ",
  Function = "??? ",
  Interface = "??? ",
  Keyword = "??? ",
  Method = "?? ",
  Module = "??? ",
  Property = "??? ",
  Snippet = "??? ",
  Struct = "??? ",
  Text = "??? ",
  Unit = "??? ",
  Value = "??? ",
  Variable = "??? ",
}

M.glpyphs = {
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '??',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',
    '???',  '???',  '???',  '???',  '???',  '???'
}

return M

