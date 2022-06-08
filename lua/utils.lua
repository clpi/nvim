-- UTILITIES FOR NVIM CONFIG --

local M = {}

M.b = vim.bo
M.o = vim.opt
M.w = vim.wo
M.cmd = vim.cmd
M.api = vim.api


function _G.t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
	return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
 end

M.termkeys = function(key, mode)
    M.api.nvim_feedkeys(M.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

M.map = function(mode, key, res, def)
    return vim.api.nvim_set_keymap(mode, key, res, def)
end
-- M.bmap = function(bn, mode, l, r, opts)
--     local op = {}
--     if opts then 
--         op = opts
--         op.buffer = true 
--     else
--         op = { buffer = true } 
--     end
--     vim.api.nvim_buf_set_keymap(bn, mode, l, r, op)
-- end
M.bmap = function(bn, mode, key, res, def)
    return vim.api.nvim_buf_set_keymap(bn, mode, key, res, def)
end
M.bmaps = {
    n = function(bn, k, v, opt) return M.bmap(bn, "n", k, v, opt) end,
    i = function(bn, k, v, opt) return M.bmap(bn, "i", k, v, opt) end,
}
M.maps = {
    i = function(k, v, opt) return M.map("i", k, v, opt) end,
    n = function(k, v, opt) return M.map("n", k, v, opt) end,
    t = function(k, v, opt) return M.map("t", k, v, opt) end,
    v = function(k, v, opt) return M.map("v", k, v, opt) end,
}

M.bopt = function(bn, opt, val)
    return vim.api.nvim_buf_set_option(bn, opt, val)
end

M.ccol = function() return vim.fn.col('.') - 1 end
M.crow = function() return vim.fn.getline('.') end
-- FOR EASIER MAPPINGS
-- For shortcuts (esp. for which-key)

kmaps = "keymaps."
M.which_key = "plugins.which-key"

M.leader       = function(s) return require("keymaps.leader." .. s) end
M.lleader      = function(s) return require("keymaps.lleader." .. s) end
M.c_c          = function(s) return require("keymaps.c-c." .. s) end
M.c_x          = function(s) return require("keymaps.c-x." .. s) end
M.c_p          = function(s) return require("keymaps.c-p." .. s) end
M.c_f          = function(s) return require("keymaps.c-f." .. s) end
M.c_l          = function(s) return require("keymaps.c-l." .. s) end
M.c_space      = function(s) return require("keymaps.c-space." .. s) end
M.tmaps        = function(s) return require("keymaps.imaps." .. s) end
M.imaps        = function(s) return require("keymaps.tmaps." .. s) end
M.cmaps        = function(s) return require("keymaps.cmaps." .. s) end

M.tele_indexmd = function(root, op, name) return
    {  ':e '..root..'index.md<CR><ESC>:Telescope '..op..'<CR>', name }
end
M.tmpl = "~/.clp/tmpl/"
M.script = "~/.clp/script/"
M.bmark = "~/.clp/bmark/"
M.inserts = {
    abspath2 = "<C-r>=expand('%l')",
    date     = "<C-R>=strftime('%m/%d/%y')<CR>",
    time     = "<C-R>=strftime('%H:%M')<CR>",
    dtime     = "<C-R>=strftime('%c')<CR>",
    relpath  = "<C-R>%<CR>",  -- relative to pwd
    relhome  = "<C-R>=expand('%:~')<CR>",
    fileroot = "<C-R>=expand('%:r')<CR>",
    fileext  = "<C-R>=expand('%:e')<CR>",
    filename = "<C-R>=expand('%:t')<CR>",
    absfile  = "<C-R>=expand('%:p')<CR>",
    absdir   = "<C-R>=expand('%:p:h')<CR>",
}

-- to get, run :echo expand('%:t')
M.buf = {
}
M.paths = {
    path     = vim.fn.expand("%:p"),
}

M.reload_conf = function()
  for name,_ in pairs(package.loaded) do
    if name:match('^cnull') then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
end

vim.api.nvim_set_keymap('n', '<Leader>vs', '<Cmd>lua ReloadConfig()<CR>', { silent = true, noremap = true })
vim.cmd('command! ReloadConfig lua ReloadConfig()')








---------------------- older stuff ---------------------

--[[
vim.o: behaves like :set
vim.go: behaves like :setglobal
vim.bo: behaves like :setlocal for buffer-local options
vim.wo: behaves like :setlocal for window-local options
]]--

B = vim.bo
O = vim.opt
W = vim.wo


CMD = vim.cmd
API = vim.api

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
	return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
 end

M.nmap = function(k, v, d) return M.map("n", k, v, d) end
M.bnmap = function(b, k, v, d) return M.bmap(b, "n", k, v, d) end
M.vmap = function(k, v, d) return M.map("v", k, v, d) end
M.imap = function(k, v, d) return M.map("i", k, v, d) end
M.tmap = function(k, v, d) return M.map("t", k, v, d) end

M.mo = function(n, s, b, e) return {
    noremap = n, silent = e, buffer = b, expr = e
} end
M.mopt = {
    nsb = M.mo(true, true, true, false),
    f =   { expr = false, noremap = false, silent = false, buffer = false },
    en =  { expr = true, noremap = true, silent = false },
    e =   { expr = true, noremap = false, silent = false },
    es =  { expr = true, noremap = false, silent = true},
    n =   { expr = false, noremap = true, silent = false},
    ns =  { expr = false, noremap = true, silent = true },
    s =  { expr = false, noremap = false, silent = true },
    ens = { expr = true, noremap = true, silent = true },
}

M.memo = function (f)
  local t = {}
  return function(x)
    local y = t[x]
    if y == nil then y = f(x); t[x] = y end
    return y
  end
end

M.wmap = function(cmd, name) return { cmd, name } end

M.wedit = function(file, name)
  local f = "<CMD>edit " .. file .. "<CR>"
  -- NOTE: here would strip to last ext-less part of file to be name
  return M.wmap("<CMD>edit " .. file .. "<CR>", name)
end

return M


