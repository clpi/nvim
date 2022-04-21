-- NOTE just is just m -- subject to chng
local M = {}
local texec = require("keymaps.common").texec
local tprompt = require("keymaps.common").tprompt
local texecf = require("keymaps.common").texec_file

local ut = require("utils")
local ins = ut.inserts

function M.curr_buf(build) return
{ name = "+buf",
    ["<space>"] = {"TermExec cmd='".. build .. " %'<LEFT><LEFT><LEFT>", 'buf as args'},
    T = texecf(build .. " test <C-r>=expand('%:p:h')", "test buf"),
    B = texecf(build .. " build <C-r>=expand('%:p::')","build buf"),
    W = texecf(build .. " wasm <C-r>=expand('%:p::')","wasm buf"),
    w = texec(build .. " wasm %", build .. " wasm %"),
    t = texec(build .. " test %", build .. " test %"),
    r = texec(build .. " run %", build .. " run %"),
    b = texec(build .. " build %", build .. " build %"),
    x = texec(build .. " bench %", build .. " bench %"),
    f = texec(build .. " fmt %", build .. " fmt %"),
}
end
function M.e_workspace_builder(build)
    return ":e "..build.."file<CR>"
end
function M.e_buf_builder(build)
    return ":e <C-r>=expand('%:p:h')<CR>/"..build.."file<CR>"
end
function M.template_buf(build)
    return ut.tmpl..build .. "/<C-r>=expand('%:e')<CR>/"..build.."file"
end
function M.e_template_buf(build)
    return ":e "..ut.tmpl..build .. "/<C-r>=expand('%:e')<CR>/"..build.."file<CR>"
end
function M.template(build, ft)
    return {
        ":e "..ut.tmpl..build .. "/".. ft .."/"..build.."file <CR>",
        ft .. "." .. build
    }
end
function M.ft_templates(build) return
{name= "+filetype",
    ["<space>"] = {"<ESC>:Telescope find_files theme=dropdown path=~/.clp/tmpl/"..build.."<CR>", "telescope"},
    ["<cr>"] = M.template(build, build),
    c = M.template(build, "c"),
    C = M.template(build, "cc"),
    r = M.template(build, "rs"),
    h = M.template(build, "hs"),
    z = M.template(build, "zig"),
    R = M.template(build, "rb"),
    n = M.template(build, "nim"),
    j = M.template(build, "clj"),
    p = M.template(build, "py"),
    P = { name = "+py",
        f = M.template(build, "py/fastapi"),
        d = M.template(build, "py/django")
    }
}
end

function M.prompt(build, args) return {name="+prompt",
    m = tprompt(build .. "" .. args, build .. ""),
    r = tprompt(build .. " run ", build .. " run"),
    b = tprompt(build .. " build ", build .. " build"),
    g = tprompt(build .. " push ", build .. " push"),
    t = tprompt(build .. " test ", build .. " test"),
    x = tprompt(build .. " bench ", build .. " bench"),
    f = tprompt(build .. " fmt ", build .. " fmt"),
    c = tprompt(build .. " clean ", build .. " clean"),
    d = tprompt(build .. " debug ", build .. " debug"),
    D = tprompt(build .. " deploy ", build .. " deploy"),
    p = tprompt(build .. " publish ", build .. " publish"),
    }
end

    -- TODO: do for rakefile, cargo just?
-- TODO make telescope ext to search for cmds, release as plugin!
M.maps = function(build)
return { name = "+".. build,
    ["<space>"] = M.curr_buf(build),
    ["<tab>"] = M.ft_templates(build),
    ["<c-f>"] = M.ft_templates(build),
    [";"] = M.prompt(build, ""),
    ["."] = M.prompt(build .. "", build .. " prompt " .. ""),
    [","] = tprompt(build .. "", build .. " prompt"),
    ["<cr>"] = texec(build .. "", build .. " default"),
    ["/"] = texec(build .. " --list", build .. " list"),
    ["?"] = texec(build .. " --help", build .. " help"),
    ["-"] = M.prompt(build, "<C-r>=expand('%:p:h')<CR>"),
    T = M.ft_templates(build),
    B = M.prompt(build, "<C-r>=expand('%')<CR>"),
    j = tprompt(build .. "", build .. " prompt"),
    t = texec(build .. " test", build .. " test"),
    r = texec(build .. " run", build .. " run"),
    b = texec(build .. " build", build .. " build"),
    x = texec(build .. " bench", build .. " bench"),
    d = texec(build .. " bench", build .. " bench"),
    g = texec(build .. " push", build .. " push"),
    f = texec(build .. " fmt", build .. " fmt"),
    i = texec(build .. " install", build .. " install"),
    m = texec(build .. "", build .. " default"),
    M = M.curr_buf(build),
    D = texec(build .. " deploy", build .. " deploy"),
    c = texec(build .. " clean", build .. " clean"),
    P = texec(build .. " publish", build .. " publish"),
    w = texec(build .. " wasm", build .. " wasm"),
    A = texec(build .. " ASM", build .. " asm"),
    a = texec(build .. " add", build .. " add"),
    p = texec(build .. " podman", build .. " podman"),
    n ={"!cp -r "..M.template_buf(build).." ./<CR>","create ".. build.."file"},
    e = { M.e_workspace_builder(build), "edit "..build, },
    E = { ":e "..M.template_buf(build).."<CR>", "edit buf tmpl"}
}
end
return M
