-- WINDOW RESIZE KEYMAPS  [ <space>r ] --

local M = {}

M.n = { maps = { name = "+search",
    ["<cr>"] = {":SearchBoxIncSearch<CR>", "search box"},
    -- TODO make search/replace for word under cursor
    ["<space>"] = { ":s/<c-r>///g<Left><Left>", "repl cursor word"},
    ["-"] = { "<ESC>:split<CR>", "splith"},
    ["_"] = { "<ESC>:vsplit<CR>", "splitv"},
    [","] = {"<ESC>:SearchBoxSimple<CR>", "Simple"},
    ["."] =  {"<ESC>:SearchBoxReplace<CR>", "Simple"},
    [">"] =  {"<ESC>:SearchBoxReplace<CR>", "Simple"},
    ["/"] = {"<ESC>:SearchBoxReplace<CR>", "replace"},
    z = { ":Telescope zoxide list theme=dropdown<CR>", "zoxide"},
    r = {":SearchBoxReplace<CR>", "find & r"},
    b = { ":Telescope current_buffer_fuzzy_find<CR>", "fuzzy find"},
    R = { ":%s///gi<left><left><left><left>", "replace"},
    s = {"<ESC>:SearchBoxIncSearch<CR>", "IncSearch"},
    M = {"<ESC>:SearchBoxMatchAll<CR>", "MatchAll" },
    S = {"<ESC>:SearchBoxSimple<CR>", "Simple" }
}, opts={
    prefix="s",
    mode = "n"
    } }

-- M.v = { maps = { name = "+search",
--     s = {"<esc>:searchboxincSearch visual_mode=true<cr>", "IncSearch"},
--     R = {"<esc>:searchboxReplace visual_mode=true<cr>", "SearchReplace"},
-- } }

return M
