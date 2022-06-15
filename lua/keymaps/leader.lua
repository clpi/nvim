-- LEADER KEY MAPPINGS --

-- NOTE: Leader <space> normal mode mappings
-- 	For visual mode, require("plugins.which-key.lleader.visual")
-- 	If gets to lengthy, break up into per key modules in the folder

-- TODO: Add a tasks, async jobs mapping, as well as a remote connections
--        mapping for editing on servers

local nmaps = function(filen) return
    require("keymaps.leader."..filen).n.maps
end
local vmaps = function(filen) return
    require("keymaps.leader."..filen).v.maps
end
local com = require"keymaps.common"
local tele = com.tele
local browse = com.tele_browse
local path = com.tele_browse_path


-- NOTE: MISC. keymaps

-- This is because the WhichKey prompt is unreliable to come up on a single space keypress
-- nmap("<SPACE>", "<ESC>:WhichKey <space><CR>", { noremap = true, silent = true })
-- vmap("<SPACE>", "<ESC>:WhichKey <space><CR>", { noremap = true, silent = true })



-- NOTE: WHICHKEY MAPS
local M = {}
    -- ["_"]       = nmaps("terminal"), graveyard
M.n = {  maps = {
    ["<space>"] = nmaps("find"),
    ["<c-space>"] = nmaps("spc"),
    ["<s-bs>"]   = {"<ESC>:<C-u>e #<CR>"},
    ["<bs>"] = { "<CMD>nohlsearch<CR>", "which_key_ignore" },
    ["<cr>"] = { "<CMD><UP><CR>", "repeat cmd"},
    ["<c-q>"] = { "<CMD>qa!<CR>", "qall"},
    -- ["<ESC>"] = { "", ""},
    -- NOTE non letters are opened to being remapped
    ["."]       = { "<CMD>Telescope file_browser theme=dropdown path=.<CR>", "files" },
    [","]       = { "<CMD>Telescope buffers theme=dropdown<CR>", "buffers" },
    ["="]       = { "<CMD>Telescope buffers theme=dropdown<CR>", "buffers" },
    ["'"]       = { "<CMD>Telescope file_browser theme=dropdown<CR>", "fileb" },
    ["\""]       = { "<CMD>Telescope git_files theme=dropdown<CR>", "gfiles" },
    ["+"]       = { "<CMD>tabnew<CR>", "+ workspace"},
    [";"] = { "<CMD>Telescope command_history theme=dropdown<CR>", "cmd history" },
    ["<CMD>"] = { "<CMD>Telescope commands theme=dropdown<CR>", "commands" },

    ["/"] = { "<CMD>Telescope search_history theme=dropdown<CR>", "search history" },
    ["?"] = { "<CMD>Telescope current_buffer_fuzzy_find theme=dropdown<CR>", "buf fzf"},
    ["`"] = { "<CMD>Telescope live_grep theme=dropdown<CR>", "lgrep" },
    ["~"] = { "<CMD>Telescope grep_string theme=dropdown<CR>", "gstring" },
    ["("] = { "<CMD>tabprevious<CR>", "workspace <"},
    [")"] = { "<CMD>tabprevious<CR>", "workspace >"},
    -- ["["] = { "<CMD>tabprevious<CR>", "workspace <"},
    -- ["]"] = { "<CMD>tabprevious<CR>", "workspace >"},
    ["{"] = { "gT", "ws -"},
    ["}"] = { "gt", "ws +"},
    ["<"] = { "<CMD>bprev<CR>", "buf -"},
    [">"] = { "<CMD>bnext<CR>", "buf +"},
    ["1"] = { },
    ["-"]       = nmaps("dir"),
    ["_"]       = nmaps("terminal"),
    ["\\"]      = nmaps("extras"),
    a = nmaps("a"),
    b = nmaps("b"),
    c = nmaps("code"),
    C = nmaps("config"),
    d = nmaps("dir"),
    e = nmaps("e"),
    f = nmaps("files"),
    E = { "<CMD>Telescope<CR>", "telescope"},
    F = { "<CMD>FzfLua<CR>", "fzf lua"},
    g = nmaps("g"),
    i = nmaps("i"),
    m = nmaps("m"),
    o = nmaps("o"),
    r = nmaps("r"),
    s = nmaps("s"),
    t = nmaps("t"),
    p = nmaps("p"),
    P = nmaps("p"),
    v = nmaps("vim"),
    W = nmaps("window"),
    x = nmaps("exec"),
    B = nmaps("b"),
    D = nmaps("d"), -- DB?
    H = nmaps("help"),
    O = nmaps("org"),
    S = nmaps("scripts"),
    T = nmaps("tasks"),
    R = nmaps("repl"),
    V = nmaps("vibe"),
    w = nmaps("w"),
    z = { "<CMD>Telescope zoxide list theme=dropdown<CR>", "zoxide"}
}, opts = {
    mode = "n",
    prefix = "<space>",
    buffer = nil,
    silent = false,
    noremap = true,
    nowait = false,
} }


M.v = { maps = {
    ["<space>"] = vmaps("find"),
    ["<tab>"] = vmaps("workspace"),
    ["-"] = vmaps("dir"),
    d = vmaps("d"),
    R = vmaps("repl"),
    o = vmaps("o"),
    m = vmaps("m"),
    t = vmaps("t"),
    O = vmaps("org"),
    w = vmaps("window"),
    W = vmaps("w"),
}, opts = {
    mode = "v",
    prefix = "<space>",
    buffer = nil,
    silent = false,
    noremap = true,
    nowait = false,

} }

return M
