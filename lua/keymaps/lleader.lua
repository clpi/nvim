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
	["."] = { ":Telescope live_grep<CR>", "grep"},
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
    w = require("keymaps.lleader.wiki").n.maps,
    c = { name = "+c"

    },
    z = { name = "+zig",
	t = { ":TermExec cmd='zig test %'<CR>", "test buf"},
    },
    n = { name = "+nim",
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
    h = { name = "hover"}
},
    opts = require("keymaps.common").opts.n(",")}

M.v = { 
    maps = M.n.maps,
    opts = require("keymaps.common").opts.v(",")
}

return M
