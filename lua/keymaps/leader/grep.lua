local M = {}

M.n = { maps = {
    name="+grep",
        ["/"] = { "<cmd>Telescope theme=dropdown live_grep<CR>"},
        ["."] = { "<cmd>Telescope theme=dropdown current_buffer_fuzzy_find<CR>"},
        ["<space>"] = { "Telescope grep_string", "grepstr<CR>"},
    }, opts = {
        prefix = "\\"

    }
}
