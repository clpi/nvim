-- NVIM ORG-MODE KEYMAPS  [ <space>O ] --

local M = {}

M.n = { maps = { name = "+org",
    ["<space>"] = { ":e ~/org/index.org<CR>:Telescope find_files<CR>", "telescope"},
    i = { ":e ~/org/index.org<CR>", "index"},
    I = { ":e ~/org/ideas/index.org<CR>", "ideas"},
    j = { ":e ~/org/journal/index.org<CR>", "journal"},
    J = { ":e ~/org/journal.org<CR>", "journal.org"},
    N = { name = "+neorg",
	i = { ":e ~/norg/index.norg<CR>", "index"},
    }
} }

M.v = M.n

return M
