-- NOTE: from kickstart.nvim
-- local imap = function(k, v, opt) vim.keymap.set("i", k, v, opt) end
-- local nmap = function(k, v, opt) vim.keymap.set("n", k, v, opt) end

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', ';', ":", {})

vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>sf', function()
require('telescope.builtin').find_files { previewer = false }
end)
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>st', require('telescope.builtin').tags)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>so', function()
require('telescope.builtin').tags { only_current_buffer = true }
end)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)

-- NOTE: end
--
-- KEYMAPS UTILS nvim.n
local utils = require('utils')

-- " NOTE:"
    -- - <C-h> = <BS>
    -- - <C-i> = <TAB>
    -- - <C-n> = <CR>
    -- - <C-j> = <c-@>

-- vim.keymap.set('n', ':', "<CMD>Telescope commands<CR>", {})

-- ([

 local default = { noremap = true }
 local noremap = { noremap= true }
local f =   { expr = false, noremap = false, silent = false }
local en =  { expr = true, noremap = true, silent = false }
local e =   { expr = true, noremap = false, silent = false }
local es =  { expr = true, noremap = false, silent = true}
local n =   { expr = false, noremap = true, silent = false}
local ns =  { expr = false, noremap = true, silent = true }
local s =  { expr = false, noremap = false, silent = true }
local ens = { expr = true, noremap = true, silent = true }

vim.cmd[[nmap Q :]]


local function map(mode, key, res, def)
    return vim.api.nvim_set_keymap(mode, key, res, def)
end
local nmap = utils.nmap
local vmap = utils.vmap
local tmap = utils.tmap
local imap = utils.vmap
local xmap = utils.tmap
local cmap = utils.tmap

-- map("n", "<space>", "<cmd>WhichKey<CR>", default)
nmap(";", ":", {})
vmap(';', ':' ,{})
-- imap(",,", "<ESC>", {silent = true, nowait = true})
-- imap("jk", "<ESC>", {silent = true, nowait = true})
-- imap("jj", "<ESC>", {silent = true, nowait = true})

-- imap("jk", "<ESC>h", f)

-- nmap("<C-s>", ":w<cr>", s)

-- XXX XXX XXX Just various convenience mappings XXX XXX XXX
nmap("<c-j>",  "<c-d>", {})
nmap("<c-k>", "<c-u>", {})
vmap("<c-j>",  "<c-d>", {})
vmap("<c-k>", "<c-u>", {})
-- imap("<c-j>",  "<c-d>", {})
-- imap("<c-k>", "<c-u>", {})

-- nmap("J", "<ESC>:bnext<CR>", default)
-- nmap("K", "<ESC>:bprev<CR>", default)

-- NOTE: Terminal mappings
tmap("<C-CR>", "<C-\\><c-n>", ns)
tmap("<ESC>", "<C-\\><c-n><ESC>", ns)
tmap("<C-[><C-[>", "<C-\\><C-n>", ns)
tmap("qq", "<C-\\><C-n>", ns)
-- tmap("kj", "<C-\\><C-n>", ns)
-- tmap("jk", "<C-\\><C-n>", ns)
tmap(",t", "<C-\\><C-n>:ToggleTerm<CR>", ns)
tmap("qq", "<C-\\><c-n>", ns)
tmap("<c-space>", "<C-\\><c-n><ESC>:ToggleTermAll<CR>", ns)
tmap("<c-_>", "<C-\\><c-n>", ns)
tmap("<c-l>", "<C-\\><c-n><ESC>:ToggleTermAll<CR>", ns)


nmap('U', ':redo<CR>', {})
nmap('0', '$', { noremap = true})
nmap("<C-0>", '^', {noremap=true})
nmap('Y', 'y$', { noremap = true})

map('v', '$', 'g_', {noremap = true})
map('x', '$', 'g_', {noremap = true})
map('v', '>', '>gv', default)
map('v', '<', '<gv', default)

nmap('J', ':bnext<CR>', default)
nmap('K', ':bprev<CR>', default)
-- nmap("J", ":BufferLineCycleNext<CR>", default)
-- nmap("K", ":BufferLineCyclePrev<CR>", default)

nmap('H', ':tabprevious<CR>', default)
nmap('L', ':tabnext<CR>', default)
-- Resize splits
-- Jump to splits
nmap('<space>h', '<c-w>h', noremap)
nmap('<space>l', '<c-w>l', noremap)
nmap('<space>j', '<c-w>j', noremap)
nmap('<space>k', '<c-w>k', noremap)
nmap('<leader>wh', '<c-w>h', noremap)
nmap('<leader>wl', '<c-w>l', noremap)
nmap('<leader>wj', '<c-w>j', noremap)
nmap('<leader>wk', '<c-w>k', noremap)

nmap('<Left>', '<c-w>h', noremap)
nmap('<right>', '<c-w>l', noremap)
nmap('<down>', '<c-w>j', noremap)
nmap('<up>', '<c-w>k', noremap)
nmap('<leader>zo', ':foldopen<CR>', default) --clear highlights
nmap('<leader>zc', ':foldclose<CR>', default) --clear highlights
-- Easy quit/save mappings
map('c', 'w!!',               '%!sudo tee > /dev/null %', default)
-- map('c', 'tele','<C-u>Telescope ', default)
-- map('c', 't,,','<C-u>Telescope ', default)
-- map('c', 'li,','<C-u>LspInstall ', default)
-- map('c', 'pack','<C-u>Packer', default)
-- nmap('<c-;>', ':!', default)
-- Move line up/down
-- Set edit modes
-- nmap('<leader>sp', ':setlocal pastetoggle<CR>', default)

-- <C-;> (unset)

-- <space>; (unset)
-- nmap('<leader><leader>/', ':%s///gi<left><left><left><left>', { noremap = true })
-- nmap('<leader><leader>;', ':Telescope commands<CR>', default)

-- Tab ops

-- nmap('<leader><bs>', ':nohlsearch<CR>', default) --clear highlights

-- Open/close folds

--[[ nmap('<leader>b1', ':b<space>1<CR>', default)
nmap('<leader>b2', ':b<space>2<CR>', default)
nmap('<leader>b3', ':b<space>3<CR>', default)
nmap('<leader>b4', ':b<space>4<CR>', default)
nmap('<leader>b5', ':b<space>5<CR>', default)
nmap('<leader>b6', ':b<space>6<CR>', default)
nmap('<leader>b7', ':b<space>7<CR>', default)
nmap('<leader>b8', ':b<space>8<CR>', default)
nmap('<leader>b9', ':b<space>9<CR>', default)
nmap('<leader>b0', ':b<space>0<CR>', default)
nmap('<leader>1', ':b<space>1<CR>', default)
nmap('<leader>2', ':b<space>2<CR>', default)
nmap('<leader>3', ':b<space>3<CR>', default)
nmap('<leader>4', ':b<space>4<CR>', default)
nmap('<leader>5', ':b<space>5<CR>', default)
nmap('<leader>6', ':b<space>6<CR>', default)
nmap('<leader>7', ':b<space>7<CR>', default)
nmap('<leader>8', ':b<space>8<CR>', default)
nmap('<leader>9', ':b<space>9<CR>', default)
nmap('<leader>0', ':b<space>0<CR>', default) ]]

-- Insert mode motion
map('i', '<c-a-j>', '<down>', default)
map('i', '<c-m-h>', '<left>', default)
map('i', '<c-m-k>', '<up>', default)
map('i', '<c-m-l>', '<right>', default)
map('i', '<c-m-w>', '<esc>lwi', default)
map('i', '<c-m-e>', '<esc>lea', default)
map('i', '<c-m-b>', '<esc>bi', default)
map('i', '<c-m-x>', '<esc>xi', default)

-- Command mode motion
map('c', '<c-a-h>', '<left>', {})
map('c', '<c-a-h>', '<left>', {})
map('c', '<c-a-k>', '<up>', {})
map('c', '<c-a-l>', '<right>', {})

-- Split mappings
-- nmap('<leader>-', '<C-w>s<C-w>j', default)
-- nmap('<leader>_', '<C-w>v<C-w>l', default)
-- nmap('<leader>=', '<C-w>v<C-w>l', default)
-- nmap('<leader>s-', '<C-w>s<C-w>j', default)
-- nmap('<leader>s_', '<C-w>v<C-w>l', default)
-- nmap('<leader>s=', '<C-w>v<C-w>l', default)

-- Split terminal mappings
nmap('<leader>t-', '<C-w>s:term<CR>i', { noremap = true })
nmap('<leader>t_', '<C-w>v:term<CR>i', { noremap = true })
nmap('<leader>t=', '<C-w>v:term<CR>i', { noremap = true })

-- NOTE: SCroll through commands with c-j c-n
-- NOTE: default control mode maps:
--        - <c-u   clear commando
--        - <c-u   clear command
--        - <c-b   to beginning
--        - <c-e   to end
--        - <c-c   cancel
--        - <c-r   register insert
--        - <c-w   delete last word
--        - <c-f  seleect thru previous
--
map('c', '<c-j>', '<c-n>', default)
map('c', '<c-k>', '<c-p>', default)
map('c', '<c-h>', '<C-u>Telescope command_history<CR>', default)

imap('<C-_>', '<ESC>ja', { nowait=true, silent = true, noremap = true})
imap('<C-d>', '<ESC>ja', { nowait=true, silent = true, noremap = true})
imap('<C-u>', '<ESC>ka', { nowait=true, silent = true, noremap = true})
imap('<C-k>', '<ESC>ka', { nowait=true, silent = true, noremap = true})
imap('<C-l>', '<ESC>la', { nowait=true, silent = true, noremap = true})
imap('<C-h>', '<ESC>i', { nowait=true, silent = true, noremap = true })

-- PLUGIN MAPS figure out how to do this with packer

-- Surround.vim
map ('n', ',s', 'ysiw', default)
map ('n', ',S', 'ysiW', default)
-- Special services
map ('n', '<space>G', ':Neogit<CR>', default)
map ('n', '<space>T', ':Trouble<CR>', default)

-- <C-h> (undefined)

-- FZF (<C-f> and <space>f)
map ('n', '<c-f><c-f>', ':Telescope find_files<CR>', default)
map ('n', '<c-f><c-w>', ':FzfLua files cwd=~/mk<CR>', default)
map ('n', '<c-f><c-h>', ':Telescope oldfiles<CR>', default)
map ('n', '<c-f><c-b>', ':Telescope buffers<CR>', default)
map ('n', '<c-f><c-c>', ':Telescope commands<CR>', default)
map ('n', '<c-f><c-p>', ':Telescope commands<CR>', default)
map ('n', '<c-f><c-f>', ':FzfLua files<CR>', default)
map ('n', '<c-f><c-o>', ':FzfLua oldfiles<CR>', default)
map ('n', '<c-f><c-r>', ':FzfLua files cwd=~/<CR>', default)
map ('n', '<c-f><c-d>', ':FzfLua files cwd=~/.config/<CR>', default)
map ('n', '<c-f><c-n>', ':FzfLua files cwd=~/.config/nvim<CR>', default)
map ('n', '<c-f><c-h>', ':Telescope oldfiles<CR>', default)
map ('n', '<c-f><c-b>', ':Telescope buffers<CR>', default)
map ('n', '<c-f><c-c>', ':Telescope commands<CR>', default)
-- Snippets (<space>s)
-- map ('n', '<leader>so', ':VsnipOpen<CR>1<Co>', default)
-- map ('n', '<leader>se', ':VsnipOpenEdit<CR>1oCR>', default)
-- map ('n', '<leader>s-', ':VsnipOpenSplit<CR>1<CR>', default)
-- map ('n', '<leader>s_', ':VsnipOpenVsplit<CR>1<CR>', default)
-- map ('n', '<leader><space>so', ':VsnipOpen<CR>--CR>', default)
-- map ('n', '<leader><space>se', ':VsnipOpenEdit<CR>2<CR>', default)
-- map ('n', '<leader><space>s-', ':VsnipOpenSplit<CR>2<CR>', default)
-- map ('n', '<leader><space>s_', ':VsnipOpenVsplit<CR>2<CR>', default)
-- map ('v', '<leader>sy', ':VsnipYank<CR>', default)
--([ map ('i', '<c-tab>,'  , "luasnip#expand_or_jumpable() ? <Plug>luasnip-expand-or-jump : '<c-tab>'" , expr)
--[[ map ('i', '<c-s-tab>',  "<cmd>lua' require'luasnip'.jump(-1)<Cr>", expr)
map ('i', '<c-n>', "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-n>'", expr)
map ('s', '<c-n>', "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-n>'", expr) ]]
--[[ map('s',  '<c-tab>', "<cmd>lua require('luasnip').jump(1)<C", silent)
map('s',  '<c-s-tab>', "<cmd>lua require('luasnip').jump(-1)<Cr>", silent) ]]

-- NVIM Tree.lua
--([ map ('n', '<leader>n', ':NvimTreeToggle<CR>', default)
--[[ map ('n', '<leader>oe', ':NvimTreeToggle<CR>', default)
map ('n', '<leader>ov', ':VsnipOpenEdit<CR>', default)
map ('n', '<leader>os', ':SymbolsOutline<CR>', default)
map ('n', '<leader>ot', ':ToggleTerm<CR>', default)
map ('n', '<leader>of', ':Lspsaga open_floaterm<CR>', default)
map ('n', '<leader>oh', ':Lspsaga hover_doc<CR>', default)
map ('n', '<leader>of', ':TroubleToggle lsp_definitions<CR>', default)
map ('n', '<leader>or', ':TroubleToggle lsp_references<CR>', default)
map ('n', '<leader>od', ':TroubleToggle lsp_implementations<CR>', default)
map ('n', '<leader>od', ':TroubleToggle lsp_document_diagnostics<CR>', default)
map ('n', '<leader>oD', ':TroubleToggle lsp_workspace_diagnostics<CR>', default)
map ('n', '<leader>ol', ':TroubleToggle lsp_loclist<CR>', default)
map ('n', '<leader>oL', ':Lspsaga lsp_finder<CR>', default)
map ('n', '<leader>oq', ':TroubleToggle quickfix<CR>', default)
map ('n', '<leader>om', ':messages<CR>', default) ]] 




-- odnt work
--([ map ('n', '<c-;>', ':ToggleTerm<CR>', default)
-- map ('v', '<c-;>', ':ToggleTerm<CR>', default)
-- map ('n', '<>', ':ToggleTerm<CR>', default)
-- map ('t', '<c-;>', ':ToggleTerm<CR>', default)

map ('t', 'kj', '<C-\\><C-n>', { silent = true, nowait=true})

-- Rust actions
-- nmap('<leader>lh', require'rust-tools.hover_actions'.hover_actions(), default)


-- compe
nmap( '<space>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', default)
nmap( '<space>gD', '<cmMd>lua vim.lsp.buf.declaration()<CR>', default)
--[[

nmap( '<space>ch', '<cmd>lua vim.lsp.buf.hover()<CR>', default)
nmap( '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', default)
nmap( '<space>cd', ':LspDiagnostics 0<CR>', default)
nmap( '<space>cD', ':LspDiagnosticsAll<CR>', default)
nmap( '<space>cr', '<cmd>lua vim.lsp.buf.references()<CR>', default)
nmap( '<space>ci', '<cmd>lua vim.lsp.buf.implementation()<CR>', default)
nmap( '<space>cy', '<cmd>lua vim.lsp.buf.buf_type_definition()<CR>', default)
map('x',  '<space>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', default)
nmap( '<space>ck', '<cmd>lua vim.lsp.buf.signature_help()<CR>', default)
map('x',  '<space>cs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', default)
nmap( '<space>cS', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', default)
nmap( '<space>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', default)
map('x',  '<space>cf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', default) ]]
-- nmap( '<Tab>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', default)
-- nmap( '<S-Tab>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', default)

-- nmap( ',rr', ':Crun<CR>', default)
-- nmap( ',rb', ':Cbuild<CR>', default)
--([ nmap( ',ra', ':RustHoverActions<CR>', default)

vim.cmd [[ vnoremap ,rf <ESC>:RustFmtRange<CR>]]
vim.cmd [[ vnoremap ,ra <ESC>:RusHoverRange<CR>t]]
nmap(',rr', ':TermExec cmd="cargo run"<CR>', { noremap = true})
nmap(',rb', ':TermExec cmd="cargo build"<CR>', { noremap = true})

nmap(',zr', ':TermExec cmd="zig build run"<CR>', { noremap = true})
nmap(',zb', ':TermExec cmd="zig build"<CR>', { noremap = true})
nmap(',zt', ':TermExec cmd="zig test"<CR>', { noremap = true})
--([ nmap(',zb', ':compiler zig_build_exe<CR>', { noremap = true})
nmap(',zt', ':compiler zig_test<CR>', { noremap = true})
nmap(',zt', ':compiler zig_test<CR>', { noremap = true})


nmap( ',fr', ':FlutterRun<CR>', default)
-- COMPE
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end
map("s", "<Tab>", "v:lua.tab_complete()", {silent=true,expr = true})
map("i", "<c-j>", "v:lua.tab_complete()", {silent=true,expr = true})
map("s", "<c-j>", "v:lua.tab_complete()", {silent=true,expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {silent=true,expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {silent=true,expr = true})
map("s", "<c-k>", "v:lua.s_tab_complete()", {silent=true,expr = true})

-- leader normal mode command
local lnmc = function(key, target)
   return nmap("<space>" .. key, "<ESC>:" .. target .."<CR>", ns) 
end

local stele = function(key, target)
    return nmap("<space>" .. key, "<ESC>:Telescope " .. target .. "<CR>", ns)
end
local dtele = function(key, target)
    return nmap("<space><space>" .. key, "<ESC>:Telescope " .. target .. "<CR>", ns)
end
vim.cmd [[tnoremap <silent> <C-[><C-[> <C-\><C-n> ]]




-- map("n", "<space><space>g", "<ESC>:Telescope live_grep<CR>", n)
-- map("n", "<space>fE", "<ESC>:Telescope symbols<CR>", n)
-- dtele("C", "colorschemes")
-- dtele("c", "commands")
-- dtele("b", "builtins")
-- dtele("h", "help_tags")
-- dtele("m", "man_pages")
-- dtele("f", "file_browser")
-- dtele("-", "fd")
-- dtele("gf", "git_files")
--
-- nmap("g<space>", "<ESC>:Telescope live_grep<CR>", ns)
-- nmap("g,", "<ESC>:Telescope grep_string<CR>", ns)
--
-- dtele("/", "buffers")
-- dtele("G", "live_grep")
-- dtele("C", "cheatsheets<CR>")
--
-- map("n", "<c-v>c", ":Cheatsheet<CR>", ns)
-- map("n", "<c-v><c-v>c", ":CheatsheetEdit<CR>", ns)
--
-- nmap("<space>bd", "<ESC>:bwipeout<CR>", ns)
-- vmap("<space>bd", "<ESC>:bwipeout<CR>", ns)
--
-- nmap("<space>ss", "<ESC>:SearchBoxIncSearch<CR>", n)
-- vmap("<space>ss", "<esc>:searchboxincSearch visual_mode=true<cr>", n)
-- nmap("<space>sr", "<ESC>:SearchBoxReplace<CR>", n)
-- vmap("<space>sr", "<esc>:searchboxReplace visual_mode=true<cr>", n)

-- Convenience telescopes

lnmc("n", "NvimTreeToggle")
lnmc("Nr", "NvimTreeRefresh")
lnmc("Nf", "NvimTreeFind")

nmap(",tt", ":ToggleTerm<CR>",ns)
nmap(",,t", ":ToggleTermAll<CR>",ns)


lnmc("a<space>", "AerialToggle!")
lnmc("at", "AerialTreeToggle!")
lnmc("ao", "AerialTreeOpenAll")
lnmc("ac", "AerialTreeCloseAll")
lnmc("aa", "AerialToggle!")
lnmc("an", "AerialNext")
lnmc("ap", "AerialPrev")

-- TERM SENDING STUFF t
lnmc("tl", "TermExec cmd=lsd")

lnmc(",,r", "TermExec cmd=cargo run")
lnmc(",,n", "TermExec cmd=nimble run")
lnmc(",,z", "TermExec cmd=zig build run")


nmap("<space>v=b", ":<C-u>luafile %<CR>", n)
nmap("<space>v=i", ":<C-u>luafile ~/.config/nvim/init.lua<CR>", n)

map("n", "g<c-g>", "<ESC>:Telescope live_grep<CR>", ns)

-- NEORG KEYMAPS
-- nmap("<c-n><c-n>", "<ESC>:NeorgStart<CR>", ns)
-- nmap("<c-n><c-j><c-j>", "<ESC>:Neorg journal today<CR>", ns)
-- nmap("<c-n><c-j><c-p>", "<ESC>:Neorg journal yesterday<CR>", ns)
-- nmap("<c-n><c-j><c-n>", "<ESC>:Neorg journal tomorrow<CR>", ns)

nmap("<C-o>", "<ESC>:<C-u>ToggleTerm<CR>", ns)
tmap("<C-o>", "<C-\\><C-n>:<C-u>ToggleTerm<CR>", ns)
vmap("<C-o>", "<ESC>:<C-u>ToggleTerm<CR>", ns)

-- nmap("<C-m>", "<ESC>:<C-u>ToggleTerm<CR>", ns)
-- tmap("<C-m>", "<C-\\><C-n>:<C-u>ToggleTerm<CR>", ns)
-- vmap("<C-m>", "<ESC>:<C-u>ToggleTerm<CR>", ns)


map("n", "<leader>wa", ":$tabnew<CR>", { noremap = true })
map("n", "<leader>wc", ":tabclose<CR>", { noremap = true })
map("n", "<leader>wo", ":tabonly<CR>", { noremap = true })
map("n", "<leader>wn", ":tabn<CR>", { noremap = true })
map("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
map("n", "<leader>wmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
map("n", "<leader>wmn", ":+tabmove<CR>", { noremap = true })
--- CODE STUFF <c-space>
-- local yabs = require('yabs')

--[[ nmap("<space>cb", yabs.run_task('build'), n)
nmap("<space>cr", yabs.run_task('build_and_run'), n)
nmap("<space>c<space>", yabs.run_command('echo hello, world', 'quickfix', { open_on_run = 'always' }), n) ]]

local ftmap = function(ft, mode, keymap, cmd)
    vim.cmd("autocmd FileType "
	.. ft .. " "
	.. mode .. "noremap <buffer> "
	.. keymap  .. " "
	.. cmd)
end


local ftimap = function(ft, keymap, cmd) ftmap(ft, "i", keymap, cmd) end
local ftnmap = function(ft, keymap, cmd) ftmap(ft, "n", keymap, cmd) end
local ftvmap = function(ft, keymap, cmd) ftmap(ft, "v", keymap, cmd) end

ftnmap("rust", "<c-space><cr>", "<ESC>:TermExec cmd=cargo r<CR>")
ftnmap("rust", "<c-space>r", "<ESC>:TermExec cmd=cargo run<CR>")
ftnmap("rust", "<c-space>t", "<ESC>:TermExec cmd=cargo test<CR>")
ftnmap("rust", "<c-space><c-t>", "<ESC>:TermExec cmd='cargo test %'<CR>")
ftnmap("rust", "<c-space>b", "<ESC>:TermExec cmd=cargo build<CR>")
ftnmap("rust", "<c-space>s", "<ESC>:TermExec cmd=cargo bench<CR>")

ftnmap("zig", "<c-space><CR>", "<ESC>:TermExec cmd='zig build run'<CR>")
ftnmap("zig", "<c-space><c-t>", "<ESC>:TermExec cmd='zig test %'<CR>")
ftnmap("zig", "<c-space><c-r>", "<ESC>:TermExec cmd='zig run %'<CR>")
ftnmap("zig", "<c-space>r", "<ESC>:TermExec cmd='zig run src/main.zig'<CR>")
ftnmap("zig", "<c-space>r", "<ESC>:TermExec cmd='zig run src/main.zig'<CR>")
ftnmap("zig", "<c-space><c-s>", "0r ~/.config/nvim/templates/zig/snippets/std.zig")
-- TODO figure out how to get current buf and send it to termexec
ftnmap("zig", "<c-space>t", "<ESC>:TermExec cmd='zig test '.<CR>")

ftnmap("nim", "<c-space><cr>", "<ESC>:TermExec cmd='nimble run'<CR>")
ftnmap("nim", "<c-space><c-r>", "<ESC>:TermExec cmd='nim c -r %'<CR>")
ftnmap("nim", "<c-space>r", "<ESC>:TermExec cmd='nim c -r src/main.nim'<CR>")

ftnmap("clojure", "<c-space><c-r>", "<ESC>:TermExec cmd='lein run %'<CR>")


nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', default)
nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>', default)
-- nmap('<space>cf', '<cmd>lua vim.lsp.buf.definition()<CR>', default)
-- nmap('<space>cl', '<cmd>lua vim.lsp.buf.declaration()<CR>', default)
-- nmap('<space>ch', '<cmd>lua vim.lsp.buf.hover()<CR>', default)
-- nmap(',h', '<cmd>lua vim.lsp.buf.hover()<CR>', default)
-- nmap('<space>ci', '<cmd>lua vim.lsp.buf.implementation()<CR>', default)
-- nmap('<space>cr', '<cmd>lua vim.lsp.buf.references()<CR>', default)
  -- nmap('<space>cs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', default)
nmap(',cwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', default)
nmap(',cwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', default)
nmap(',cwf', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', default)
-- nmap('<space>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>', default)
-- nmap(',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', default)
-- nmap('<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', default)
  nmap(',a', '<cmd>lua vim.lsp.buf.code_action()<CR>', default)
  nmap(',h', '<cmd>lua vim.lsp.buf.hover()<CR>', default)
  -- nmap('<space>cD', '<cmd>lua vim.diagnostic.open_float()<CR>', default)
  nmap('<s-tab>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', default)
  nmap('<tab>', '<cmd>lua vim.diagnostic.goto_next()<CR>', default)
  nmap(',cq', '<cmd>lua vim.diagnostic.setloclist()<CR>', default)
  nmap(',cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', default)





-- NOTE: Function key keymaps
nmap("<F1>", "<ESC>:TermExec cmd='just '", default)
nmap("<F2>", "<ESC>:TermExec cmd='just '", default)
nmap("<F3>", "<ESC>:TermExec cmd='just '", default)
nmap("<F4>", "<ESC>:TermExec cmd='just '", default)
nmap("<F5>", "<ESC>:TermExec cmd='just '", default)
nmap("<F6>", "<ESC>:TermExec cmd='just '", default)
nmap("<F7>", "<ESC>:TermExec cmd='just '", default)
nmap("<F8>", "<ESC>:TermExec cmd='just '", default)
nmap("<F9>", "<ESC>:TermExec cmd='just '", default)
nmap("<F10>", '<ESC>:TermExec cmd=""<LEFT>', default)
nmap("<F11>", '<ESC>:make ', default)
nmap("<F12>", "<ESC>:Zi<CR>", default)

nmap("<S-F1>", '<ESC>:TermExec cmd=""<LEFT>', default)
nmap("<S-F2>", '<ESC>:TermExec cmd=""<LEFT>', default)
nmap("<S-F3>", '<ESC>:TermExec cmd=""<LEFT>', default)
nmap("<S-F4>", '<ESC>:TermExec cmd=""<LEFT>', default)
nmap("<S-F5>", '<ESC>:TermExec cmd=""<LEFT>', default)
nmap("<S-F6>", '<ESC>:TermExec cmd=""<LEFT>', default)
nmap("<S-F7>", '<ESC>:TermExec cmd=""<LEFT>', default)
nmap("<S-F8>", '<ESC>:TermExec cmd=""<LEFT>', default)
nmap("<S-F9>", '<ESC>:TermExec cmd=""<LEFT>', default)
nmap("<S-F10>", '<ESC>:TermExec cmd=""<LEFT>', default)
nmap("<S-F11>", '<ESC>:TermExec cmd=""<LEFT>', default)



local wk = require("which-key")

local cfg ={
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  operators = { gc = "Comments" },
  key_labels = {
    ["<space>"] = "SPC",
    ["<S-Tab>"] = "S-TAB",
    ["<BS>"] = "BS",
    ["<cr>"] = "RET",
    ["<Tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
    winblend = 10
  },
  layout = {
    height = { min = 4, max = 50 }, -- min and max height of the columns
    width = { min = 15, max = 40 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = {
	"<ESC>", "<esc>", "<Esc>", "<cr>",
	"<silent>",
	"<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = {
  --     "<space>", ",", "<c-space>", "<c-l>", "<c-x>"
  --   }, -- automatically setup triggers
  triggers = "auto",
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}
-- Normal mode <c-n>
local neorg_opts = {
  mode = "n", -- NORMAL mode
  prefix = "<C-n>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

-- Insert mode
local opts_insert = {
  mode = "i", -- NORMAL mode
  prefix = "<C-v>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}
local opts_insert2 = {
  mode = "i", -- NORMAL mode
  prefix = "<C-_>", 
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

-- todo: c-c, c-x, c-l, c-space, c-p
wk.setup(cfg)

-- ~/.config/nvim/lua/keymaps/leader.lua
-- ~/.config/nvim/lua/keymaps/lleader.lua

--! This is to conveniently set visual 
--! normal keymaps for a given prefix
local register = function(rel_path)
    local nwk = require(rel_path)
    if (nwk.n ~= nil) then wk.register(nwk.n.maps, nwk.n.opts) end
    if (nwk.v ~= nil) then wk.register(nwk.v.maps, nwk.v.opts) end
    if (nwk.i ~= nil) then wk.register(nwk.i.maps, nwk.i.opts) end
end

-- NOTE: c-t reserved for term toggle
register("keymaps.leader")
register("keymaps.lleader")
-- register("keymaps.bslash")
register("keymaps.equals")
register("keymaps.c-f")
-- register("keymaps.c-d")
-- register("keymaps.c-h")
-- register("keymaps.c-n")
register("keymaps.c-s")
register("keymaps.c-space")
-- register("keymaps.c-p")
register("keymaps.c-q")
-- register("keymaps.c-c") -- c-c or c-o for esc in ins?
-- register("keymaps.c-o")
register("keymaps.c-x")
register("keymaps.c-z")

register("keymaps.m")
register("keymaps.g")
register("keymaps.q")
register("keymaps.S")
-- register("keymaps.cr")
register("keymaps.uscore")
register("keymaps.hyphen")
--
-- register("keymaps.plus")
-- imap("<c-h>", "<left>", { noremap = true})
-- imap("<c-j>", "<down>", { noremap = true})
-- imap("<c-k>", "<up>", { noremap = true})
-- imap("<c-l>", "<right>", { noremap = true})

-- vim.cmd[[nmap <silent><nowait> gf <ESC>:<C-u>e <cfile><CR>]]
-- vim.cmd[[vmap <silent><nowait> gf <ESC>:<C-u>edit <cfile><cr>]]
-- vim.cmd[[nmap <silent><nowait> gF <ESC>:<C-u>edit <cfile>:p<cr>]]
-- vim.cmd[[vmap <silent><nowait> gF <ESC>:<C-u>edit <cfile>:p<cr>]]

vim.cmd[[nmap <nowait> ,g/ <ESC>:<C-u>e <C-r>=expand("<cfile>:p:h")<CR>/]]
vim.cmd[[nmap <nowait> ,g? <ESC>:<C-u>e <C-r>=expand("%:p:h")<CR>/]]

vim.cmd[[nmap <nowait> g; <ESC>:<C-u>e <C-r>=expand("<cfile>:p")<CR>]]
vim.cmd[[nmap <nowait> g: <ESC>:<C-u>e <C-r>=expand("%:p")<CR>]]
  
vim.cmd[[nmap <nowait> gC <ESC>:<C-u>e <C-r>=expand("<cfile>:p:h")<CR>/]]
vim.cmd[[nmap <nowait> gB <ESC>:<C-u>e <C-r>=expand("%:p:h")<CR>/]]

vim.cmd[[nmap <nowait> ,g- <ESC>:<C-u>e <C-r>=expand("$HOME")<CR>/]]
vim.cmd[[nmap <nowait> ,g_ <ESC>:<C-u>e <C-r>=expand("expand("%:p:h")<CR>/]]

map("n", "<C-n>", "<ESC>:NvimTreeToggle<CR>", ns)

-- NOTE: Replace word under cursor
-- vim.cmd[[nnoremap <expr> <space>s<cr> :%s/\<'.expand('<cword>').'\>/<&>/g<CR>]]


-- nnoremap <C-cr>
vim.api.nvim_set_keymap('n', '<Leader>vs', '<Cmd>lua ReloadConfig()<CR>', { silent = true, noremap = true })
vim.cmd('command! ReloadConfig lua ReloadConfig()')

local map = function(m, k, c, o) 
  vim.keymap.set(m, k, c, g)
end

local df = { noremap = true, silent = true, nowait = true}

local nm = function(k, c, o) map("n", k, c, o) end
local tm = function(k, c, o) map("t", k, c, o) end
local vm = function(k, c, o) map("v", k, c, o) end
local im = function(k, c, o) map("i", k, c, o) end

local tl = "<CMD>Telescope "

nm("H", "<CMD>bprev<CR>", df)
nm("L", "<CMD>bnext<CR>", df)
nm("K", "<CMD>bprev<CR>", df)
nm("J", "<CMD>bnext<CR>", df)
nm("<space>wdn", "<CMD>VimwikiMakeDiaryNote<CR>", df)
nm("<space>wdi", "<CMD>VimwikiDiaryIndex<CR>", df)
nm("<space>wdt", "<CMD>VimwikiMakeTomorrowDiaryNote<CR>", df)
nm("<space>wdy", "<CMD>VimwikiMakeYesterdayDiaryNote<CR>", df)
nm("<space>wi", "<CMD>VimwikiIndex<CR>", df)
nm("<space>n", "<CMD>NvimTreeToggle<CR>", df)
nm("<c-o>", "<CMD>ToggleTerm<CR>", df)
nm("<space>ff", tl .. "find_files<CR>", df)
nm("<space>fk", tl .. "keymaps<CR>", df)
nm("<space>fh", tl .. "oldfiles<CR>", df)
nm("<space>fH", tl .. "help_tags<CR>", df)
nm("<space>fd", tl .. "fd<CR>", df)
nm("<space>vi", "<ESC>:e ~/.config/nvim/init.lua<CR>", df)
nm("<space>vs", "<ESC>:e ~/.config/nvim/opt.lua<CR>", df)
nm("<space>vk", "<ESC>:e ~/.config/nvim/lua/keys.lua<CR>", df)
im("jk", "<ESC>l", {})
im("jj", "<ESC>", {})
nm("<space>cd", "<ESC>cd %:p:h<CR>", df)
nm("<space>sR", "<ESC>:%s/\\(\\w\\+\\)/\\u\\1/g<CR>", df)
nm("<space>sr", "<ESC>:%s/", df)
nm("<space>;", tl.."command_history<CR>", df)
nm("<space>:", tl.."commands<CR>", df)
nm("<space>/", tl.."search_history<CR>", df)
nm("<space>?", tl.."live_grep<CR>", df)

nm("<C-k>", "<C-w><C-k>", df)
nm("<C-j>", "<C-w><C-j>", df)
nm("<C-h>", "<C-w><C-h>", df)
nm("<C-l>", "<C-w><C-l>", df)
vm("<C-k>", "<C-w><C-k>", df)
vm("<C-j>", "<C-w><C-j>", df)
vm("<C-h>", "<C-w><C-h>", df)
vm("<C-l>", "<C-w><C-l>", df)

nm(",fh", "<ESC>:Telescope oldfiles<CR>", { noremap = true, silent = true, nowait = true })
nm(",fb", "<ESC>:Telescope buffers<CR>", { noremap = true, silent = true, nowait = true })
nm(",fH", "<ESC>:Telescope help_tags<CR>", { noremap = true, silent = true, nowait = true })
nm(",fM", "<ESC>:Telescope man_pages<CR>", { noremap = true, silent = true, nowait = true })
nm(",fk", "<ESC>:Telescope keymaps<CR>", { noremap = true, silent = true, nowait = true })
nm(",f<TAB>", "<ESC>:Telescope reloader<CR>", { noremap = true, silent = true, nowait = true })
nm(",f<BS>", "<ESC>:Telescope resume<CR>", { noremap = true, silent = true, nowait = true })
nm(",fG", "<ESC>:Telescope grep_string<CR>", { noremap = true, silent = true, nowait = true })
nm(",fp", "<ESC>:Telescope projects<CR>", { noremap = true, silent = true, nowait = true })
nm(",fz", "<ESC>:Telescope current_buffer_fuzzy_find<CR>", { noremap = true, silent = true, nowait = true })
nm(",Ft", "<ESC>:Telescope tagstack<CR>", { noremap = true, silent = true, nowait = true })
nm(",fT", "<ESC>:Telescope treesitter<CR>", { noremap = true, silent = true, nowait = true })
nm(",f,", "<ESC>:Telescope file_browser<CR>", { noremap = true, silent = true, nowait = true })
nm(",fd", "<ESC>:Telescope diagnostics<CR>", { noremap = true, silent = true, nowait = true })
nm(",fo", "<ESC>:Telescope vim_options<CR>", { noremap = true, silent = true, nowait = true })
nm(",fs", "<ESC>:Telescope symbols<CR>", { noremap = true, silent = true, nowait = true })
nm(",fg", "<ESC>:Telescope grep_string<CR>", { noremap = true, silent = true, nowait = true })
nm(",f<space>", "<ESC>:Telescope live_grep<CR>", { noremap = true, silent = true, nowait = true })
nm(",,,", "<ESC>:Telescope pickers<CR>", { noremap = true, silent = true, nowait = true })
nm(",fB", "<ESC>:Telescope builtin<CR>", { noremap = true, silent = true, nowait = true })
nm(",f<CR>", "<ESC>:Telescope lsp_code_actions<CR>", { noremap = true, silent = true, nowait = true })
nm(",fR", "<ESC>:Telescope lsp_references<CR>", { noremap = true, silent = true, nowait = true })
nm(",f-", "<ESC>:Telescope lsp_dynamic_workspace_symbols<CR>", { noremap = true, silent = true, nowait = true })
nm(",fO", "<ESC>:Telescope colorscheme<CR>", { noremap = true, silent = true, nowait = true })
nm(",fs", "<ESC>:Telescope lsp_document_symbols<CR>", { noremap = true, silent = true, nowait = true })
nm(",fS", "<ESC>:Telescope lsp_workspace_symbols<CR>", { noremap = true, silent = true, nowait = true })
nm(",fY", "<ESC>:Telescope symbols<CR>", { noremap = true, silent = true, nowait = true })
nm(",fI", "<ESC>:Telescope lsp_implementations<CR>", { noremap = true, silent = true, nowait = true })
nm(",fL", "<ESC>:Telescope lsp_definitions<CR>", { noremap = true, silent = true, nowait = true })
nm(",fr", "<ESC>:Telescope registers<CR>", { noremap = true, silent = true, nowait = true })
nm(",fy", "<ESC>:Telescope lsp_type_definitions<CR>", { noremap = true, silent = true, nowait = true })
nm(",fc", "<ESC>:Telescope commands<CR>", { noremap = true, silent = true, nowait = true })
nm(",fF", "<ESC>:Telescope fd<CR>", { noremap = true, silent = true, nowait = true })
nm(",ft", "<ESC>:Telescope tags<CR>", { noremap = true, silent = true, nowait = true })
nm(",ff", "<ESC>:Telescope find_files<CR>", { noremap = true, silent = true, nowait = true })
nm(",fw", "<ESC>:Telescope live_grep search_dirs={os.getenv('WIKI')} <cr>", { noremap = true, silent = true })

nm("<F1>", "<ESC>:TermExec cmd='just '", default)
nm("<F2>", "<ESC>:TermExec cmd='just '", default)
nm("<F3>", "<ESC>:TermExec cmd='just '", default)
nm("<F4>", "<ESC>:TermExec cmd='just '", default)
nm("<F5>", "<ESC>:TermExec cmd='just '", default)
nm("<F6>", "<ESC>:TermExec cmd='just '", default)
nm("<F7>", "<ESC>:TermExec cmd='just '", default)
nm("<F8>", "<ESC>:TermExec cmd='just '", default)
nm("<F9>", "<ESC>:TermExec cmd='just '", default)
nm("<F10>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<F11>", '<ESC>:make ', default)
nm("<F12>", "<ESC>:Zi<CR>", default)

nm("<S-F1>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F2>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F3>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F4>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F5>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F6>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F7>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F8>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F9>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F10>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F11>", '<ESC>:TermExec cmd=""<LEFT>', default)

nm("<space>vps", "<ESC>:PackerSync<CR>", { noremap = true, silent = true, nowait = true })
nm("<space>vps", "<ESC>:PackerSync<CR>", { noremap = true, silent = true, nowait = true })
nm("<space>vpC", "<ESC>:PackerClean<CR>", { noremap = true, silent = true, nowait = true })
nm("<space>vpG", "<ESC>:e ~/.config/nvim/lua/plug/copilot.lua<CR>", { noremap = true, silent = true, nowait = true })
nm("<space>vpi", "<ESC>:PackerInstall<CR>", { noremap = true, silent = true, nowait = true })
nm("<space>vpu", "<ESC>:PackerUpdate<CR>", { noremap = true, silent = true, nowait = true })
nm("<space>vpc", "<ESC>:PackerCompile<CR>", { noremap = true, silent = true, nowait = true })
nm("<space>vpp", "<ESC>:e ~/.config/nvim/lua/plug.lua<CR>", { noremap = true, silent = true, nowait = true })

-- nm("<space>h", "<CMD>wincmd h<CR>", { silent = true, nowait = true })
-- nm("<space>j", "<CMD>wincmd j<CR>", { silent = true, nowait = true })
-- nm("<space>k", "<CMD>wincmd k<CR>", { silent = true, nowait = true })
-- nm("<space>l", "<CMD>wincmd l<CR>", { silent = true, nowait = true })

nm("<space>wh", "<CMD>wincmd h<CR>", { silent = true, nowait = true })
nm("<space>wj", "<CMD>wincmd j<CR>", { silent = true, nowait = true })
nm("<space>wk", "<CMD>wincmd k<CR>", { silent = true, nowait = true })
nm("<space>wl", "<CMD>wincmd l<CR>", { silent = true, nowait = true })

-- nm("J", ":bnext<CR>", { silent = true, nowait = true })
-- nm("K", ":bprev<CR>", { silent = true, nowait = true })
-- nm("<space>,", ":bprev<CR>", { silent = true })
-- nm("<space>.", ":bnext<CR>", { silent = true })
nm("<space><", ":tabprev<CR>", { silent = true })
nm("<space>>", ":tabnext<CR>", { silent = true })

-- nm("H", ":tabprev<CR>", { silent = true, nowait = true })
-- nm("L", ":tabnext<CR>", { silent = true, nowait = true })
--
-- nm("m<bs>", ":nohlsearch<CR>", { silent = true, nowait = true })
-- nm(",,<bs>", ":nohlsearch<CR>", { silent = true, nowait = true })
-- nm("<space><bs>", ":nohlsearch<CR>", { silent = true, nowait = true })
-- nm("<bs><bs>", ":nohlsearch<CR>", { silent = true, nowait = true })
-- vmap("<space><bs>", ":nohlsearch<CR>", { silent = true, nowait = true })
-- nm("<space><cr>", ":ToggleTerm<CR>", { noremap = true, silent = true, nowait = true })
-- nm("<C-CR>", ":ToggleTerm<CR>", { noremap = true, silent = true, nowait = true })
nm("<C-o>", ":ToggleTerm<CR>", { noremap = true, silent = true, nowait = true })
tm("<ESC>", "<C-\\><C-n>", { noremap = true, silent = true, nowait = true })
-- tmap("<C-CR>", "<C-\\><C-n><ESC>:ToggleTerm<CR>", { noremap = true, silent = true, nowait = true })
tm("<C-o>", "<C-\\><C-n><ESC>:ToggleTerm<CR>", { noremap = true, silent = true, nowait = true })

nm("<space>zc", ":e ~/.zshrc<CR>", { noremap = true, silent = true, nowait = true })
nm("<space>za", ":e ~/.zsh/aliases.zsh<CR>", { noremap = true, silent = true, nowait = true })
nm("<space>ze", ":e ~/.zsh/exports.zsh<CR>", { noremap = true, silent = true, nowait = true })
nm("<space>zs", ":e ~/.zsh/secrets.zsh<CR>", { noremap = true, silent = true, nowait = true })

-- tmap("<C-p>", "<C-d>", {noremap=true,silent=true,nowait=true})
-- tmap("<space><cr>", ":ToggleTerm<CR>", { noremap = true, silent = true, nowait = true })
-- tmap("<space><tab>", ":ToggleTerm<CR>", { noremap = true, silent = true, nowait = true })
-- nm(",<tab>", ":ToggleTerm<CR>", { noremap = true, silent = true, nowait = true })
--
-- nm("<space>;", "<ESC>:Telescope command_history<CR>", { silent = true, nowait = true })
-- nm("<space>:", "<ESC>:Telescope commands<CR>", { silent = true, nowait = true })
-- nm("<space>/", "<ESC>:Telescope search_history<CR>", { silent = true, nowait = true })



-- nm("<space>ss", ":Sub ", n)
-- nm("<space>s<bs>", ":nohlsearch<CR> ", n)
nm("<space>om", ":messages<CR> ", n)
nm("<space>on", ":Notifications<CR> ", n)

nm("<space>bc", "<cmd>BufferKill<CR>", { noremap = true, silent = true, nowait = true })
nm("<space>bd", "<cmd>Bdelete<CR>", { noremap = true, silent = true, nowait = true })
nm("<space><space><bs>", ":nohlsearch<CR>", { noremap = true, silent = true, nowait = true })
nm("g<CR>", "<ESC>:TermExec cmd=''<LEFT>", { noremap = true, nowait = true })
nm("g<space>", "<ESC>:ToggleTerm<CR>", { noremap = true, nowait = true })
-- nm("gk", "<ESC>:TermExec cmd=''<LEFT>", { noremap = true, nowait = true })

-- nm("<space>h", "<ESC>:NvimTreeFocus<CR>", { silent = true })
-- nm("<space>h", "<ESC>:NvimTreeFocus<CR>", {silent=true})

vim.cmd("nm 0 ^")
vim.cmd("vmap 0 ^")
vim.cmd("nnoremap Q <nop>")

-- nm(">", "<ESC>:<C-u>BufferLineCycleNext<CR>", { silent = true, nowait = true })
-- nm("<", "<ESC>:<C-u>BufferLineCyclePrev<CR>", { silent = true, nowait = true })

-- nm(",a", "<ESC>:<C-u>CodeActionMenu<CR>", { silent = true, nowait = true })
nm(",d", "<ESC>:<C-u>TroubleToggle<CR>", { silent = true, nowait = true })
vm(",d", "<ESC>:<C-u>TroubleToggle<CR>", { silent = true, nowait = true })

nm("<space>tn", "<ESC>:<C-u>tabnew<CR>", { silent = true, nowait = true })
nm("<space>tc", "<ESC>:<C-u>tabclose<CR>", { silent = true, nowait = true })

nm("0", "^", {})
nm("#", "gcc", {noremap = false, silent = true, nowait =   true})

im("jj", "<ESC>", {})
im("jk", "<ESC>l", {})
-- vim.cmd[[iunm kk]]


vim.cmd[[
  im <C-A> <Home>
  im <C-B> <Left>
  im <C-E> <End>
  im <C-F> <Right>
  im <c-z> <C-Left>
  im <c-x> <C-Right>
  im <C-K> <Esc>lDa
  im <C-U> <Esc>d0xi
  im <C-Y> <Esc>Pa
  im <C-X><C-S> <Esc>:w<CR>a 
]]

require("keys.c-g")
require("keys.c-s")
require("keys.c-c")
require("keys.spc")


vim.keymap.set({ "n", "i", "v"}, "<C-f>", "<C-u>", { silent = true, nowait = true })
vim.keymap.set({ "n", "i", "v"}, "<C-d>", "<C-d>", { silent = true, nowait = true })
-- require("keys.c-c")
vim.keymap.set({"n", "i", "v"}, "<C-\\>", "<CMD>Copilot panel<CR>", df)
