--! EDIT > DIARY SETTINGS AND KEYMAPS  [<space>ed] !--

local M = {}

local base_ddir = "~/wiki/diary/"
local old_ddir = "~/wiki/diary/diary"

local tele_op = function(root, op, name) return
    {  ':e '..root..'index.md<CR><ESC>:Telescope '..op..'<CR>', name }
end
local diaries = function(rpath, name) return
    { ":e "..base_ddir..rpath..".md<CR>", name}
end

M.n = { maps = { name = "+diary",
    ["<space>"] = diaries("index", "index"),
    ["<BS>"]    = diaries("index", "index2"),
    ["<TAB>"]   = tele_op(base_ddir, "fd", "fd files"),
    ["<S-TAB>"] = tele_op(base_ddir, "fd", "fd files"),
    ["<CR>"]    = { "<ESC>:JournalToday<CR>", "daily note"},
    ["/"]       = tele_op(base_ddir, "live_grep", "grep files"),
    ["?"]       = tele_op(base_ddir, "current_buffer_fuzzy_find", "fuzzy find"),
    [","]       = tele_op(base_ddir, "file_browser", "file browser"),
    ["."]       = tele_op(base_ddir, "find_files", "find_files"),
    ["-"]       = { "<ESC>:JournalToday<CR>", "daily note"},
    ["_"]       ={ "<ESC>:JournalToday<CR>", "nested note"},
    t           = { "<ESC>:JournalToday<CR>", "daily note"},
    n           = { ":JournalTodayAlt<CR>", 'daily note nested' },
    d           = { "<ESC>:JournalToday<CR>", "daily note"},
    D           = { ":JournalTodayAlt<CR>", 'daily note nested' },
} }

M.v = M.n

return M
