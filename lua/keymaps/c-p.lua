local M = {}
local pre = "<c-p>"

M.n = {
    maps = {
        ["<c-p>"] = { ":FzfLua files cwd=.<CR>", "files"},
        ["<c-n>"] = { ":FzfLua files cwd=~/.config/nvim<CR>", "nvim"},
        ["<c-z>"] = { ":FzfLua files cwd=~/.zsh<CR>", "zsh"},
        ["<c-q>"] = { ":FzfLua quickfix<CR>", "qfix"},
        ["<c-h>"] = { ":FzfLua oldfiles<CR>", "history"},
        ["<bs>"] = { ":FzfLua grep_last<CR>", "grep last"},
        ["."] = { ":FzfLua files cwd=~/.config<CR>", "config"},
        b = { ":FzfLua buffers<CR>", "buffers"},
        c = { ":FzfLua files cwd=~/.config<CR>", "config"},
        d = { ":FzfLua lsp_document_diagnostics<CR>", "doc diagnostics"},
        g = { ":FzfLua grep<CR>", "grep"},
        h = { ":FzfLua help_tags<CR>", "help"},
        l = { ":FzfLua lines<CR>", "lines"},
        s = { ":FzfLua lsp_document_symbols<CR>", "doc symbols"},
        w = { ":FzfLua grep_cword<CR>", "grep cword"},
        L = { ":FzfLua blines<CR>", "blines"},
        G = { ":FzfLua live_grep_native<CR>", "live grep"},
        W = { ":FzfLua grep_cWORD<CR>", "grep cWORD"},
        D = { ":FzfLua lsp_workspace_diagnostics<CR>", "ws diagnostics"},
        S = { ":FzfLua lsp_workspace_symbols<CR>", "ws symbols"},
    },
    opts = {
        prefix = pre,
        mode = "n",
        silent = true,
        buffer = nil,
        noremap = true,
        nowait = true,
    },
}
M.v = {
    maps =require("keymaps.common.builder").maps("just"),
    opts = require("keymaps.common").opts.v(pre),
}
-- M.i = {
--     maps =require("keymaps.common.builder").maps("just"),
--     opts = require("keymaps.common").opts.i(pre), 
-- }
-- }
return M
