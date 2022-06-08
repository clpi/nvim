
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
    border = "none", -- none, single, double, shadow
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
-- local register = function(rel_path)
--     local nwk = require(rel_path)
--     wk.register(nwk.n.maps, nwk.n.opts)
--     wk.register(nwk.v.maps, nwk.v.opts)
-- end
--
-- register("keymaps.leader")
-- register("keymaps.lleader")
-- -- setkeymaps("c-x") when its ready
-- -- setkeymaps("c-f") when its ready
-- -- setkeymaps("c-p") when its ready
-- -- setkeymaps("c-l") when its ready
-- -- setkeymaps("c-space") when its ready
--
-- -- UNLISTED:
-- -- 	- J: Next buf
-- -- 	- K: Previous buf
-- -- 	- L: Next workspace
-- -- 	- H: Previous workspace
-- -- 	- <C-j>: Scroll down
-- -- 	- <C-k>: Scroll up
-- --
-- --
-- -- NOTE: LOCAL LEADER ACTIONS ----------------------------------
-- --
-- -- Normal mode localleader
--
-- -- NOTE: m prefix ---------------------------------------------------------
-- wk.register({
--     l = { name = "+line",
-- 	j = {"mz:m+<cr>`z", "down"},
-- 	k = {"mz:m-2<cr>`z", "up"}
--     }
-- }, { prefix = "m", mode = "n"})
--
-- wk.register({
--     l = { name = "+line",
-- 	j = {":m'>+<cr>`<my`>mzgv`yo`z", "down"},
-- 	k = {":m'<-2<cr>`>my`<mzgv`yo`z", "up"}
--     }
-- }, { prefix = "m", mode = "v"})
--
--
--
-- -- NOTE: C-x normal mode mappings ----------------------------------------
--
--
-- --------------------------------------------------------------------------
-- -- wk.register({
-- --     ["<C-space>"] = { ":Telescope find_files<CR>", "find files"},
-- --     ["<space>"] = {":Telescope live_grep<CR>", "live grep"}
-- -- }, opts3)
--
-- wk.register({
--     ["<C-d>"] = { '<C-R>=strftime("%m/%d/%y")<CR><space>', 'date' },
--     ["<C-t>"] = { '<C-R>=strftime("%H:%M")<CR><space>', 'time' },
--     d = { '<C-R>=strftime("%m/%d/%y")<CR><space>', 'date' },
--     t = { '<C-R>=strftime("%H:%M")<CR><space>', 'time' },
--     D = { '<C-R>=strftime("%m/%d/%y %H:%M")<CR><space>', 'datetime'},
--     s = { '<C-R>=strftime("*%m/%d/%y %H:%M*")<CR><space>', 'fmt datetime'}
-- }, opts_insert)
-- wk.register({
--     ["<C-n>"] = { ':NeorgStart<CR>', 'start' },
--     ["<space>"] = { ":e ~/norg/index.norg<CR>:Telescope find_files<CR>", 'telescope'},
--     ["i"] = { ":e ~/norg/ideas/index.norg<CR>", 'ideas'},
--     ["t"] = { ":e ~/norg/tasks/index.norg<CR>", 'tasks'},
-- }, neorg_opts)
-- --[[ wk.register({
--   ["<leader>"] = {
--     f = { 
--       name = "+find", 
--       f = { "<cmd>Telescope find_files<cr>", "Find File" },
--       h = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--       g = { "<cmd>Telescope live_grep<cr>", "Open Recent File" },
--     },
--     b = { name = "+buffers",
--       d = { "<cmd>bwipeout<CR>", "Wipeout current buffer"},
--       [">"] = { "<cmd>BufferLineMoveNext", "Move current buffer next in bufferline"},
--       ["<"] = { "<cmd>BufferLineMovePrev", "Move current buffer prev in bufferline"}
--     },
--     o = { name = "+open",
--       n = { "<Cmd>Notifications<CR>", "Open notifications" },
--       b = { "<Cmd>DBUIToggle<CR>", "Open DB UI" },
--       d = { "<cmd>TroubleToggle<CR>", "Open diagnostics" },
--       q = { "<cmd>TroubleToggle<CR>", "Open diagnostics" },
--       },
--     c = { name = "+code",
--       a = { "actions", "Open code actions" },
--       h = { "hover", "Open code hover" },
--       d = { "doc diagnostics", "Open document diagnostics"},
--       D = { "ws diagnostics", "Open workspace diagnostics"},
--
-- 	},
--   },
--   ["<C-f>"] = {
--     "<cmd>lua require('telescope-files').project_files()<CR>",
--     "Find files",
--   },
--   ["<C-b>"] = { "<cmd>Telescope buffers<CR>", "Buffers" },
--   ["<C-g>"] = { "<cmd>Telescope live_grep<CR>", "Live grep" },
--   ["<C-t>"] = {
--     name = "+Telescope",
--     ["<C-t>"] = { "<cmd>Telescope builtin<CR>", "Builtins" },
--     h = { "<cmd>Telescope help_tags<CR>", "Help tags" },
--   },
-- }, opts) ]]
