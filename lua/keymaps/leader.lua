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
    ["<s-bs>"]   = {"<ESC>:<C-u>e #<CR>"},
    ["<bs>"] = { ":nohlsearch<CR>", "which_key_ignore" },
    ["<cr>"] = { ":<UP><CR>", "repeat cmd"},
    ["<c-q>"] = { ":qa!<CR>", "qall"},
    -- ["<ESC>"] = { "", ""},
    -- NOTE non letters are opened to being remapped
    ["."]       = { ":Telescope file_browser theme=dropdown path=.<CR>", "files" },
    [","]       = { ":Telescope buffers theme=dropdown<CR>", "buffers" },
    ["="]       = { ":Telescope buffers theme=dropdown<CR>", "buffers" },
    ["'"]       = { ":Telescope file_browser theme=dropdown<CR>", "fileb" },
    ["\""]       = { ":Telescope git_files theme=dropdown<CR>", "gfiles" },
    ["+"]       = { ":tabnew<CR>", "+ workspace"},
    [";"] = { ":Telescope command_history theme=dropdown<CR>", "cmd history" },
    [":"] = { ":Telescope commands theme=dropdown<CR>", "commands" },

    ["/"] = { ":Telescope search_history theme=dropdown<CR>", "search history" },
    ["?"] = { "Telescope current_buffer_fuzzy_find theme=dropdown<CR>", "buf fzf"},
    ["`"] = { ":Telescope live_grep theme=dropdown<CR>", "lgrep" },
    ["~"] = { ":Telescope grep_string theme=dropdown<CR>", "gstring" },
    ["("] = { ":tabprevious<CR>", "workspace <"},
    [")"] = { ":tabprevious<CR>", "workspace >"},
    -- ["["] = { ":tabprevious<CR>", "workspace <"},
    -- ["]"] = { ":tabprevious<CR>", "workspace >"},
    ["{"] = { "gT", "ws -"},
    ["}"] = { "gt", "ws +"},
    ["<"] = { ":bprev<CR>", "buf -"},
    [">"] = { ":bnext<CR>", "buf +"},
    ["1"] = { },
    ["-"]       = nmaps("dir"),
    ["_"]       = nmaps("terminal"),
    ["\\"]      = nmaps("extras"),
    a   = nmaps("workspace"),
    b = nmaps("buf"),
    c = nmaps("code"),
    C = nmaps("config"),
    d = nmaps("dir"),
    e = nmaps("edit"),
    f = nmaps("files"),
    E = { ":Telescope<CR>", "telescope"},
    F = { ":FzfLua<CR>", "fzf lua"},
    g = nmaps("git"),
    i = nmaps("insert"),
    m = nmaps("make"),
    o = nmaps("open"),
    r = nmaps("resize"),
    s = nmaps("search"),
    t = nmaps("toggle"),
    v = nmaps("vim"),
    W = nmaps("window"),
    x = nmaps("exec"),
    B = nmaps("bookmarks"),
    D = nmaps("debug"), -- DB?
    H = nmaps("help"),
    O = nmaps("org"),
    S = nmaps("scripts"),
    T = nmaps("tasks"),
    R = nmaps("repl"),
    V = nmaps("vibe"),
    w = nmaps("wiki"),
    z = { ":Telescope zoxide list theme=dropdown<CR>", "zoxide"}
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
    d = vmaps("debug"),
    R = vmaps("repl"),
    o = vmaps("open"),
    m = vmaps("make"),
    t = vmaps("toggle"),
    O = vmaps("org"),
    w = vmaps("window"),
    W = vmaps("wiki"),
}, opts = {
    mode = "v",
    prefix = "<space>",
    buffer = nil,
    silent = false,
    noremap = true,
    nowait = false,

} }

return M
