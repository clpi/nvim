-- NOTE: Local leader normal mode mappings
-- 	For visual mode, require("plugins.which-key.lleader.visual")
-- 	If gets to lengthy, break up into per key modules in the folder
local M = {}

-- local nmaps = function(filen) return
--     require("keymaps.lleader."..filen).n.maps
-- end
local vmaps = function(filen)
    return require("keymaps.lleader."..filen).v.maps
end

local lldr = "keymaps.lleader."

M.n = { maps = {
  ["<SPACE>"] = { name = "+special", -- TODO make actual local mappings
	  ["<space>"] = { ":Telescope find_files<CR>", "find files"},
	  [","] = { ":Telescope live_grep<CR>", "grep"},
	  ["."] = { ":Telescope buffers<CR>", "buf"},
	  [";"] = { ":FzfLua commands<CR>", "commands"},
	  ["="] = { ":FzfLua man_pages<CR>", "man"},
	  ["/"] = { ":FzfLua live_grep<CR>", "live grep"},
	  ["?"] = { ":FzfLua help_tags<CR>", "help"},
	  ["-"] = { ":Telescope zoxide<CR>", "zoxide"},
	  m     = { ""}
  },
  [","] = { name = "+exec", -- TODO make actual local mappings
	  [","] = {":Telescope current_buffer_fuzzy_find<CR>", "find in file"},
	  t = { ":TermToggle<CR>", "term"},
	  g = { ":Telescope live_grep<CR>", "grep"},
  },
  ["."] = { name = "+idk",
	  [","] = {":Telescope current_buffer_fuzzy_find<CR>", "find in file"},
	  t = { ":TermToggle<CR>", "term"},
	  g = { ":Telescope live_grep<CR>", "grep"},
  },
  -- w = require("keymaps.lleader.wiki").n.maps,
  c = { name = "+code"

  },
  z = { name = "+zig",
    t = { ":TermExec cmd='zig test'<CR>", "test"},
	  T = { ":TermExec cmd='zig test %'<CR>", "test buf"},
	  b = { ":TermExec cmd='zig build'<CR>", "build"},
	  B = { ":TermExec cmd='zig build run'<CR>", "brun"},
	  r = { ":TermExec cmd='zig run'<CR>", "run"},
	  R = { ":TermExec cmd='zig run %'<CR>", "run buf"},
	  c = { ":TermExec cmd='zig cc %'<CR>", "cc buf"},
	  C = { ":TermExec cmd='zig c++ %'<CR>", "c++ buf"},
	  p = { ":TermExec cmd='zig c++ %'<CR>", "c++ buf"},
	  x = { ":TermExec cmd='zig build-exe'<CR>", "build-exe"},
	  l = { ":TermExec cmd='zig build-lib'<CR>", "build-lib"},
	  l = { ":TermExec cmd='zig build-obj'<CR>", "buil-obj"},
  },
  p = { name = "+python",
    d = { ":TermExec cmd='python3 -m pydoc %'<CR>", "pydoc buf"},
    r = { ":TermExec cmd='python3 %'<CR>", "run buf"},
    l = { "<CMD>ToggleTermSendCurrentLine<CR>", "exec ln"},
    m = { "<CMD>TermExec cmd='python3 main.py<CR>", "exec main.py"},
    p = { "<CMD>TermExec cmd='poetry run'<CR>", "poetry run"},
  },
  n = { name = "+nim",
	  n = { ":TermExec cmd='nimble run'<CR>", "nimble run"},
	  r = { ":TermExec cmd='nim c -r %'<CR>", "nim c -r buf"},
	  c = { ":TermExec cmd='nim c %'<CR>", "nim c buf"},
  },
  r = { name = "+rust",
	  a = { ":RustCodeAction<CR>", "code actions"},
	  c = { ":RustOpenCargo<CR>", "open cargo"},
	  d = { ":RustDebuggables<CR>", "debuggables"},
	  h = { ":RustHoverActions<CR>", "hover actions"},
	  j = { ":RustJoinLines<CR>", "join lines"},
	  J = { ":RustMoveItemDown<CR>", "move down"},
	  K = { ":RustMoveItemUp<CR>", "move up"},
	  p = { ":RustParentModule<CR>", "parent mod"},
	  R = { ":RustRunnables<CR>", "runnables"},
	  r = { ":RustRun<CR>", "run"},
  },
  -- h = { name = "hover"}
},
    opts = require("keymaps.common").opts.n(",")}

M.v = { 
    maps = M.n.maps,
    opts = require("keymaps.common").opts.v(",")
}

return M
