local u = require("util.keys")

local M = {
  n = {
    maps = { naem = "+telescope",
      a = u.tel("aerial", "", "aerial"),
      f = u.tel("find_files", "", "find_files"),
      F = u.tel("fd", "", "fd"),
      V = u.tel("vim_options", "theme=dropdown", "vim options"),
      H = u.tel("highlights", "", "highlights"),
      h = u.tel("help_tags", "", "help tags"),
      m = u.tel("man_pages", "", "man_pages"),
      k = u.tel("keymaps", "", "keymaps"),
      p = u.tel("projects", "", "projects"),
      P = u.tel("pickers", "", "pickers"),
      B = u.tel("bookmarks", "", "bookmarks"),
      c = u.tel("commands", "", "commands"),
      A = u.tel("autocommands", "", "autocommands"),
      j = u.tel("jumplist", "", "jumplist"),
      l = u.tel("loclist", "", "loclist"),
      q = u.tel("quickfix", "", "quickfix"),
      Q = u.tel("quickfixhistory", "", "quickfix_history"),
      i = u.tel("lsp_implementations", "", "lsp_implementations"),
      r = u.tel("lsp_references", "", "lsp_references"),
      g = u.tel("live_grep", "", "live_grep"),
      d = u.tel("diagnostics", "", "diagnostics"),
      D = u.tel("lsp_definitions", "", "lsp_definitions"),
      s = u.tel("symbols", "", "symbols"),
      R = u.tel("registers", "", "registers"),
      M = u.tel("marks", "", "marks"),
      G = u.tel("git_branches", "", "branches"),
      S = u.tel("git_stash", "", "git_stash"),
      T = u.tel("tagstack", "", "tagstack"),
      t = u.tel("tags", "", "tags"),
      C = u.tel("colorscheme", "", "colorscheme"),
      o = u.tel("oldfiles", "", "oldfiles"),
      y = u.tel("lsp_type_definitions", "", "type defs"),
      z = u.tel("zoxide", "", "zoxide"),
      ["<TAB>"] = u.tel("builtin", "", "builtin"),
      ["<SPC>"] = u.tel("lsp_dynamic_workspace_symbols", "", "dynamic symbols (ws)"),
      ["`"] = u.tel("pickers", "", "pickers"),
      ["?"] = u.tel("lsp_definitions", "", "lsp_definitions"),
      ["-"] = u.tel("zoxide", "", "zoxide"),
      ["="] = u.tel("document_symbols", "", "document_symbols"),
      ["+"] = u.tel("workspace_symbols", "", "workspace_symbols"),
      ["/"] = u.tel("search_history", "", "search_history"),
      [";"] = u.tel("command_history", "", "command_history"),
      [":"] = u.tel("commands", "", "commands"),
      ["<CR>"] = u.tel("resume", "", "resume"),
      ["<BS>"] = u.tel("reloader", "", "reloader"),
      ["."] = u.tel("treesitter", "", "treesitter"),
      [","] = u.tel("git_status", "", "git_status"),
      [">"] = u.tel("lsp_references", "", "lsp_references"),

    },
    opts = {
      noremap = true,
      silent = true,
      nowait = true,
      mode = "n",
      prefix = "<c-space>"
    }
  },
}

M.v = M.n

M.v.opts.mode = "v"

return M
