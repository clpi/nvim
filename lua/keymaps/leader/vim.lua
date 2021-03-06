local M = {}
function M.request(nd)
    return "keymaps.common."..nd
end
local conf = function(name) return
    {"<ESC>:LuaConf "..name.."<CR>",name}
end
-- For plugins/<name> mappings
local pconf = function(name) return
    { "<ESC>:LuaConf plug/"..name.."<CR>", name}
end
-- For keymaps/leader/<name> mappings
local kconf = function(name) return
    { "<ESC>:LuaConf keymaps/leader/"..name.."<CR>", name}
end
-- For keymaps/<name>
local wconf = function(name) return
    { "<ESC>:LuaConf keymaps/"..name.."<CR>", name}
end
-- For filetype/<name>
local ftconf = function(ftc)
    return { ":LuaConf filetype/"..ftc..".lua<CR>", ftc }
end
-- local multiconf = function(p, list_of_kidns)
    -- Take a list of identifiers with a single parent
    -- (i.e. "filetype") and creates a table to just put into
    -- the filetype slot
-- enume

M.n = { maps = { name = "+vim",
  [","] = { ":e ~/.config/nvim/lua/keymaps/lleader.lua<CR>"},
  ["."] = { ":e ~/.config/nvim/lua/style.lua<CR>"},
  ["<space>"] = { "<ESC>:luafile %<CR>", "luafile"},
  ["/"] = { "<ESC>:FzfLua ~/.config/vim/lua<CR>", "luafile"},

  a = conf("acmd"),
  b = conf("abbr"),
  c = conf("cmd"),
  V = { name = "+custom",
    c = { "<CMD>e ~/nv/cayu/lua/cayu/init.lua<CR>", "cayu"},
    e = { "<CMD>e ~/nv/exi.lua/lua/exi.lua/init.lua<CR>", "exi.lua"},
  },

  d = { name = "+dap",
    d = conf("debug"),
  },


  f = { name = "+filetype",
    r = ftconf("rust"),
    z = ftconf("zig"),
    n = ftconf("nim"),
    p = ftconf("python"),
    c = ftconf("c"),
    d = ftconf("D"),
    l = ftconf("lua<CR>"),
    j = ftconf("js"),
    t = ftconf("ts"),
    C = ftconf("cpp"),
  },
  g = kconf("g"),
  G = kconf("grep"),
  ["\\"] = pconf("neogit"),
  k = { name = "+keymaps",
    ["<CR>"]      = wconf("leader"),
    ["<space>"]   =  { name = "+spc",
      ["<space>"] = kconf("spc"),

    },
    ["<c-space>"] = wconf("c-space"),
    ["<tab>"]     = kconf("workspace"),
    [","]         = wconf("lleader"),
    ["-"]         = { ":e ~/.config/nvim/lua/keymaps/hyphen.lua<CR>", "hyphen"},
    ["_"]         = { ":e ~/.config/nvim/lua/keymaps/uscore.lua<CR>", "uscore"},
    ["="]         = { ":e ~/.config/nvim/lua/keymaps/equals.lua<CR>", "equals"},
    a             = kconf("a"),
    b             = kconf("buffer") ,
    c             = kconf("code") ,
    d             = kconf("d"),
    e             = kconf("e"),
    f = kconf("find"),
    g = kconf("g"),
    F = kconf("files"),
    G = { ":e ~/.config/nvim/lua/keymaps/g.lua<CR>", "g maps"},
    i = kconf("i"),
    m = kconf("m"),
    k = { ":e ~/.config/nvim/lua/keys.lua<CR>", "misc"},
    K = {":FzfLua ~/.config/nvim/lua/keymaps/leader.lua<CR>", "leader"},
    l = { ":e ~/.config/nvim/lua/lsp/keymaps.lua<CR>", "lsp maps"},
    -- M = { ":e ~/.config/nvim/lua/keymaps/m.lua<CR>", "make"},
    o = kconf("o"),
    q = { ":e ~/.config/nvim/lua/keymaps/q.lua<CR>", "q maps"},
    t = kconf("t"),
    s = kconf("s"),
    v = kconf("vim"),
    w = kconf("w"),
    r = kconf("r"),
    B = kconf("s-b") ,
    ["<C-g>"] = kconf("goto"),
    H = kconf("help"),
    R = kconf("repl"),
    -- S = kconf("snippets"),
    S =  { ":e ~/.config/nvim/lua/keymaps/shifts.lua<CR>", "S maps"},
    T = kconf("tasks"),
    x = kconf("exec"),
    O = kconf("org"),
    W = kconf("Window"),
    Q = kconf("shiftq"),
    X = kconf("shiftx"),
    M = kconf("shiftm"),
    z = kconf("z"),
    Z = kconf("zoxide")
  },
  i = { ":LuaConfInit<CR>", "init"},
  K = conf("keymaps"),
  l = { name = "+lsp",
    ["<space>"] = conf("lsp"),
    ["<cr>"] = conf("lsp"),
    ["/"] = {":FzfLua ~/.config/nvim/lua/lsp<CR>"},
    c = conf("lsp"),
    C = pconf("cmp"),
    s = conf("lsp/servers"),
    k = conf("lsp/keymaps"),
    h = conf("lsp/handlers"),
    d = conf("lsp/diagnostics"),
    S = conf("lsp/setup"),
    r = pconf("rust_tools"),
    i = { ":e ~/.config/nvim/lua/lsp/installer.lua<CR>", "installer"},
    l = { name = "+lang",
      ["<space>"] = { ":e ~/.config/nvim/lua/lsp/servers/languages.lua<CR>", "langs"},
      ["<cr>"] = { ":e ~/.config/nvim/lua/lsp/servers/languages.lua<CR>", "langs"},
    
      p = { ":e ~/.config/nvim/lua/lsp/servers/pylsp.lua<CR>", "pylsp"},
      P = { ":e ~/.config/nvim/lua/lsp/servers/pyright.lua<CR>", "pyright"},
      y = { ":e ~/.config/nvim/lua/lsp/servers/pyre.lua<CR>", "pyre"},
      d = { ":e ~/.config/nvim/lua/lsp/servers/diagnosticls.lua<CR>", "diagnosticls"},
      t = { ":e ~/.config/nvim/lua/lsp/servers/tsserver.lua<CR>", "tsserver"},
      n = { ":e ~/.config/nvim/lua/lsp/servers/nimls.lua<CR>", "nimls"},
      m = { ":e ~/.config/nvim/lua/lsp/servers/lua.lua<CR>", "lua"},
      v = { ":e ~/.config/nvim/lua/lsp/servers/vim.lua<CR>", "vim"},
      e = { ":e ~/.config/nvim/lua/lsp/servers/efm.lua<CR>", "efm"},

    },
    L = { ":e ~/.config/nvim/lua/lsp/servers/languages.lua<CR>", "langs"},
  },
  n = pconf("nvim-tree"),
  -- P = conf("plug"),
  s = conf("opts"),
  t = pconf("telescope"),
  u = conf("util"),
  v = { "<ESC>e ~/.vimrc<CR>", "vimrc"},
  W = conf("whichkey"),
  A = pconf("aerial"),
  C = pconf("cmp"),
  F = pconf("formatter"),
  L = conf("lsp"),
  N = pconf("neorg"),
  O = pconf("org"),
  r = { ":e ~/.config/nvim/lua/plug/rust_tools.lua", "rust"},
  R = { ":e ~/.config/nvim/lua/plug/rust_tools.lua", "rust"},
  P = {  name= "+packer",
    P = { "<CMD>PackerCompile profile=true<CR>", "compile + profile"},
    u = { ":PackerUpdate<CR>", "update" },
    i = { ":PackerInstall<CR>", "install" },
    s = { ":PackerSync<CR>", "sync" },
    c = { ":PackerCompile<CR>", "compile" },
    C = { ":PackerClean<CR>", "clean" },
    p = { ":PackerProfile<CR>", "profile"},
    S = { ":PackerStatus<CR>", "status"},
    t = { ":PackerSnapshot<SPACE>", "snapshot"},
    l = { ":PackerLoad<SPACE>", "load"},
    d = { ":PackerSnapshotDelete<SPACE>", "load"},
    r = { ":PackerSnapshotRollback<SPACE>", "rollback"},
    e = { "<CMD>e ~/.config/nvim/lua/plug/pack.lua<CR>", "edit config"},
  },
  p = { name = "+plugins",
    b = pconf("bufferline"),
    C = pconf("copilot"),
    r = pconf("rust_tools"),
    R = pconf("crates"),
    S = pconf("lualine"),
    N = pconf("neorg"),
    c = pconf("cmp"),
    w = pconf("vimwiki"),
    i = pconf("indent"),
    f = pconf("fzflua"),
    D = pconf("trouble"),
    s = pconf("sniprun"),
    p = pconf("project"),
    m = pconf("mkdnflow"),
    l = pconf("luasnip"),
    d = pconf("dap"),
    n = pconf("nvimtree"),
    ["<space>"] = conf("plug"),
    O = { ":e ~/.config/nvim/lua/plug/toggleterm.lua<CR>"},
    g = { ":e ~/.config/nvim/lua/plug/copilot.lua<CR>"},
    o = { ":e ~/.config/nvim/lua/plug/org.lua<CR>", "org"},
    ["\\"] = { ":e ~/.config/nvim/lua/plug/term.lua<CR>", "toggleterm"},
    ["<tab>"] = { ":e ~/.config/nvim/lua/plug/term.lua<CR>", "toggleterm"},
    t = { ":e ~/.config/nvim/lua/plug/telescope.lua<CR>", "telescope"},
    T = { ":e ~/.config/nvim/lua/plug/telescope.lua<CR>", "treesitter"},
    ["<CR>"] = {"<CMD>e ~/.config/nvim/lua/plug.lua<CR>", "edit plugins"},
    P = {"<CMD>e ~/.config/nvim/lua/plug.lua<CR>", "edit plugins"},
  },
  T = pconf("treesitter"),
  w = pconf("vimwiki"),
  ["?"] = pconf("treesitter"), -- consolidate
  ["<bs>"] = { ":luafile ~/.config/nvim/init.lua<CR>", "source init"},
  ["<tab>"] = { ":luafile %%<CR>", "source this"},
},
-- local etc = {
    -- ["_"]         = kconf("terminal"),
    -- ["\\"]        = kconf("extras"),
    -- ["-"]         = kconf("dir"),
    -- }
opts = require("keymaps.common").opts.n("v")
};
M.v = {
    maps=M.n.maps,
    opts=require("keymaps.common").opts.v("v")
}

return M
