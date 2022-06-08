-- NOTE: _ (extra maps)
local M = {}

local common = require("keymaps.common")
local browse = common.tele_browse
local tele = common.tele
local texec = common.texec
local path = common.tele_browse_path

M.n= { maps = {
    ["<space>"] = browse("browse"),
    ["-"] =  browse("browse"),
    ["_"] = { "Telescope zoxide list theme=dropdown<CR>", "z"},
    -- ["="] = { "<ESC>:Telescope file_browser theme=dropdown<CR>", "Telescope file_browser theme=dropdown"},
    -- ["+"] = { "<ESC>:Telescope file_browser theme=dropdown<CR>", "Telescope file_browser theme=dropdown"},
    -- ["z"] = { "<ESC>:Telescope file_browser theme=dropdown<CR>", "Z inter", },
    ["<CR>"]    = tele("resume", "resume"),
    ["<BS>"]    = tele("resume", "resume"),
    ["<TAB>"]   = browse("browse"),
    [","] = tele("buffers", "buffers"),
    ["."] = tele("find_files", "find_files"),
    ["`"] = tele("find_files", "find_files"),
    ["~"] =  tele("find_files", "find_files"),
}, opts = {
    prefix = "\\",
    mode = "n",
    silent = false,
    buffer = nil,
    noremap = true,
    nowait = true,
} }

M.v = {
    maps = {
    ["<space>"] = browse("browse"),
    ["-"] =  browse("browse"),
    ["_"] = tele("zoxide", "zoxide list"),
    -- ["="] = { "<ESC>:Telescope file_browser theme=dropdown<CR>", "Telescope file_browser theme=dropdown"},
    -- ["+"] = { "<ESC>:Telescope file_browser theme=dropdown<CR>", "Telescope file_browser theme=dropdown"},
    -- ["z"] = { "<ESC>:Telescope file_browser theme=dropdown<CR>", "Z inter", },
    ["<CR>"]    = tele("resume", "resume"),
    ["<BS>"]    = tele("resume", "resume"),
    ["<TAB>"]   = browse("browse"),
    [","] = tele("buffers", "buffers"),
    ["."] = tele("find_files", "find_files"),
    ["`"] = tele("find_files", "find_files"),
    ["~"] =  tele("find_files", "find_files"),

    },
    opts = {
    prefix = "\\",
    mode = "v",
    silent = false,
    buffer = nil,
    noremap = true,
    nowait = true,
    }
}

return M

