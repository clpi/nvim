local tdir = [[:e ~/.config/nvim/templates/]]

return { name = "+tmpls",
    ["<space>"] = { tdir.."<CR><ESC>:Telescope fd theme=dropdown", "fd"},
    ["c"] = { tdir.."c/c.c<CR>", "c"},
    ["z"] = { tdir.."zig/new.zig<CR>", "zig"},
    ["r"] = { tdir.."rust/rust.zig<CR>", "rust"},
    ["p"] = { tdir.."py/py.py<CR>", "py"},
    ["s"] = { tdir.."sh/sh.sh<CR>", "shell"},
    ["J"] = { tdir.."Justfile<CR>", "just"},
    ["m"] = { tdir.."Makefile<CR>", "make"},
    C     = { tdir.."cc/cc.cc<CR>", "c++"},
    l     = { tdir.."lua/lua.lua<CR>", "lua" },
    L     = { tdir.."clj/clj.clj<CR>", "clj" },
    j     = { tdir.."js/js.js<CR>", "js"},
    t     = { tdir.."ts/ts.ts<CR>", "ts"},
    D     = { tdir.."d/d.d<CR>", "D"},
}

