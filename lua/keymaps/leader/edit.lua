--! EDIT SETTINGS AND KEYMAPS  [<space>e] !--
--! TODO: Add mappings to actual VIM templates which
--! prepopulate certain files and patterns of file/directory
--! matching with template info.

local M = {}

local lre = function(s) return 
    require("keymaps.leader.edit."..s).n.maps
end
local ed = function(rpath, name) return { ":e "..rpath.."<CR>", name }end

local dvsad = "~/wiki/devisa/"
local idled = "~/wiki/idlets/"
local papers = { name = "+papers",}
local docs = { name = "+docs" }
local blogs = { name = "+blogs" }
local saved = { name = "+saved",
    ["<space>"] = ed("~/wiki/res/bookmarks.md", "index"),
    r           = ed("~/wiki/res/index.md", "res"),
}
local idlets = { name = "+idlets",
    ["<space>"] = ed(idled.."index.md", "index"),
}
local dvsa = { name = "+devisa",
    ["<space>"] = ed(dvsad.."index.md", "index"),
}

M.shift_n = { maps = { name = "+Edit!" ,
},
    opts = {

    }
}

M.n = { maps = { name = "+edit",
    ["<space>"] = { name = "+special" },
    ["<cr>"] = require("keymaps.common").tmpl_ft_fzf(),
    b = { name = "+bash",
        b = { ":e ~/.bashrc<CR>", "bashrc" },
        ["<space>"] = {":e ~/.config/bash/fzf.sh<CR>", "fzf"},
        ["<CR>"] = { ":FzfLua files ~/.config/bash<CR>", "find"}
    },
    B = lre("boilerplate"),
    c = lre("config"),
    d = lre("diary"),
    n = { name = "+nu",
        f = { ":e ~/.config/nu/config.nu<CR>", "fish" },
        ["<space>"] = {":e ~/.config/nu/fzf.nu<CR>", "fzf"},
        ["<CR>"] = { ":FzfLua files ~/.config/nu<CR>", "find"}
    },
    f = { name = "+fish",
        f = { ":e ~/.config/fish/config.fish<CR>", "fish" },
        ["<space>"] = {":e ~/.config/fish/fzf.fish<CR>", "fzf"},
        ["<CR>"] = { ":FzfLua files ~/.config/fish<CR>", "find"}
    },
    p = { ":e ~/.profile<CR>", "profile" },
    v = { name = "+custom",
        i = {":e ~/.config/ivv/init.vim<CR>", "ivv init"},
        I = {":FzfLua files ~/.config/ivv/<CR>", "ivv fzf"},
        c = {":e ~/.config/invi/init.vim<CR>", "invi init"},
        C = {":FzfLua ~/.config/invi<CR>", "invi fzf"},
        n = {":e ~/.config/nvim/init.lua<CR>", "nvim init"},
        N = {":FzfLua files ~/.config/nvim<CR>", "nvim fzf"},
        v = {":e ~/.config/vim/init.lua<CR>", "vim init"},
        V = {":FzfLua files ~/.config/vim<CR>", "vim fzf"},
    },
    u = { ":e ~/.newsboat/urls<CR>", "newsb"} ,
    [";"] = lre("projects"),
    i = lre("infra"),
    s = lre("scripts"),
    T = require("keymaps.common.templates"), -- NOTE: vim tmpl -- deprecate?
    j = lre("jobs"),
    t = require("keymaps.common").e_tmpl(),
    ["."] = require("keymaps.common").tmpl_fzf(),
    ["\\"] = require("keymaps.common").tmpl_fzf(),
    ["'"] = require("keymaps.common").tmpl_fzf(),
    [":"] = require("keymaps.common").tmpl_fzf(),
    ["["] = require("keymaps.common").tmpl_fzf(),
    ["]"] = require("keymaps.common").tmpl_fzf(),
    ["<CR>"] = require("keymaps.common").tmpl_fzf(),
    ["<bs>"] = require("keymaps.common").tmpl_fzf(),
    ["<esc>"] = require("keymaps.common").tmpl_fzf(),
    ["<tab>"] = require("keymaps.common").tmpl_fzf(),
    ["/"] = { ":FzfLua files ~/.config<CR>", "fzf .config"},
    ["?"] = { ":FzfLua files ~/<CR>", "fzf .config"},
    W = { ":e ~/.config/wezterm/wezterm.lua<CR>", "init" },
    F = { ":e ~/.config/fish/config.fish<CR>", "init" },
    ["0"] = { ":e ~/.p10k.zsh<CR>", "init" },
    -- w = lre("wiki"),
    -- ["/"] = lre("search"),
    -- ["?"] = lre("wiki"),
    -- ["!"] = lre("wiki"),
    -- ["*"] = lre("wiki"),
    --
    -- ["*"] = lre("wiki"),
    -- ["("] = lre("wiki"),
    -- [")"] = lre("wiki"),
    -- ["-"] = lre("wiki"),
    -- ["_"] = lre("wiki"),
    -- ["+"] = lre("wiki"),
    -- ["="] = lre("wiki"),
    -- ["~"] = lre("wiki"),
    -- ["`"] = lre("wiki"),
    -- ["<"] = lre("wiki"),
    -- [">"] = lre("wiki"),
    -- ["@"] = lre("wiki"),
    -- ["#"] = lre("wiki"),
    -- ["$"] = lre("wiki"),
    -- ["%"] = lre("wiki"),
    -- ["^"] = lre("wiki"),
    -- ["&"] = lre("wiki"),
    -- ["*"] = lre("wiki"),
    z = require("keymaps.leader.edit.zsh"),
    L = blogs,
    D = docs,
    P = papers,
    S = saved,
    -- T = { name = "+vim templates" }, -- for prepopulating files with data
    V = dvsa,
    I = idlets,
} }

M.v = M.n

return M
