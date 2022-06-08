-- NOTE: OPEN KEYMAPS  [ <space>o ] --

local M = {}

M.n = { maps = { name = "+open",
  ["<space>"] = { "<cmd>TroubleToggle<CR>", "trouble" },
  ["`"] = { "<Cmd>Telescope notify theme=dropdown<CR>", "notifications" },
  e = { ":NvimTreeToggle<CR>", "NvimTree" },
  n = { "<Cmd>Notifications<CR>", "notifications" },
  b = { "<Cmd>DBUIToggle<CR>", "DB UI" },
  d = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "ws diagnostics" },
  l = { "<cmd>TroubleToggle loclist<cr>", "trouble llist"},
  ["<TAB>"] = { "<CMD>DBUIToggle<CR>", "db ui",},
  q = { "<cmd>TroubleToggle quickfix<CR>", "quickfix" },
  v = { name="+view",
    q = {":copen<CR>", "qf open"},
    j = { ":jumps<CR>", "jumps" },
    l = { ":llist<cr>", "llist"},
    h = { ":highlights<cr>", "hi"},
  },
  m = { name="+markdown",
    m = { "<Plug>MarkdownPreview", "preview" },
    p = { "<Plug>MarkdownPreview", "preview" },
    s = { "<Plug>MarkdownPreviewStop", "stop" },
    t = { "<Plug>MarkdownPreviewToggle", "toggle" },
    ["<space>"] = { "<Plug>MarkdownPreviewToggle", "toggle" },
    ["<cr>"] = { "<Plug>MarkdownPreviewToggle", "toggle" },
  },
  s = { "<CMD>SymbolsOutline<CR>", "symbols"},
  r = { "<cmd>TroubleToggle lsp_references<CR>", "lsp references" },
  i = { "<cmd>TroubleToggle lsp_implementations<CR>", "lsp impls" },
  c = { "<Cmd>ColorizerToggle<CR>", "colorizer"},
  f = { "<cmd>TroubleToggle lsp_definitions<CR>", "lsp defs" },
  y = { "<cmd>TroubleToggle lsp_type_definitions<CR>", "lsp types" },
  t = { "<Cmd>ToggleTerm<CR>", "term"},
  T = { "<Cmd>ToggleTermToggleAll<CR>", "term all"},
  o = { "<Cmd>SymbolsOutline<CR>", "symbols"},
  a = { "<Cmd>AerialToggle<CR>", "aerial"},
  A = { "<Cmd>AerialTreeToggle<CR>", "aerial tree"},
  S = { ":TSToggleAll<space><C-i>", "toggle TS all"},
  M = { ":messages<CR>", "messages"},
  D = { "<cmd>:TroubleToggle document_diagnostics<CR>", "doc diagnostics"},
  N = { ":NeorgStart<CR>", "neorg"},
  R = { ":IronRepl<CR>", "REPL"},
  P = { ":setlocal pastetoggle<CR>", "paste"},
} ,
    opts = {
        prefix = "o",
        mode = "n",
        silent = true,
        buffer = nil,
        noremap = true,
        nowait = true,
    },
}

M.v = {
    maps = M.n.maps,
    opts = {
        prefix = "o",
        mode = "v",
        silent = true,
        buffer = nil,
        noremap = true,
        nowait = true,
    }
}

return M


