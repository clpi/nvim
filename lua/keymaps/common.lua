local M = {}

local ins = require"utils".inserts
function M.tprompt(cmd, name)
    return { "<ESC>:TermExec cmd='"..cmd.." '<LEFT>", name}
end

-- exe: common.texec_file("just test", utils.inserts.absfile, "test buf file")
-- exe: common.texec_file("just build", utils.inserts.fileroot, "make buf bin")
function M.texec_file(cmd, name)
    return { "<ESC>:TermExec cmd='" .. cmd .. " %'<CR>", name}
end

function M.texec(cmd, name)
    return { "<ESC>:TermExec cmd='"..cmd.."'<CR>", name}
end

function M.tele(cmd, name)
    return {"<esc>:Telescope "..cmd.."<cr>", name}
end

function M.teled(cmd, name)
    return {"<esc>:Telescope "..cmd.." theme=dropdown<cr>", name}
end
function M.telepd(cmd, name, path)
    return {"<esc>:Telescope "..cmd.." path="..path.." theme=dropdown<cr>", name}
end

function M.tele_files(name)
    return {"<esc>:Telescope find_files theme=dropdown<cr>", name}
end

function M.tele_browse(name)
    return {"<esc>:Telescope file_browser theme=dropdown<cr>", name}
end

function M.tele_buf(name)
    return {"<ESC>:Telescope file_browser theme=dropdown path=<C-r>=expand('%:p:h')<CR>", name}
end
function M.tele_browse_path(name, path)
    return {"<ESC>:Telescope file_browser theme=dropdown path="..path.."<CR>", name}
end

function M.e_tmpl() return
    { ":e "..require("utils").tmpl.."<C-r>=expand('%:e')<CR>/<C-r>=expand('%:t')<CR><CR>", "edit named tmpl"}
end

function M.tmpl_fzf() return
    {"<ESC>:Telescope file_browser theme=dropdown path="..require("utils").tmpl.."<CR>", "tele tmpl"}
end

function M.tmpl_ft_fzf() return
    {"<ESC>:Telescope file_browser theme=dropdown path="
        ..require("utils").tmpl
        .."<C-r>=expand('%:e')<CR><CR>", "tele ft tmpl"
    }
end

-- takes str, str
--
function M.opt(pre, mode) return {
    prefix = pre,
    mode = mode,
    silent = false,
    buffer = nil,
    noremap = true,
    nowait = true,
} end
M.opts = {
    n = function(pre) return M.opt(pre, "n") end ,
    v = function(pre) return M.opt(pre, "v") end,
    i = function(pre) return M.opt(pre, "i") end,
}


M.templates = require"keymaps.common.templates"


return M
