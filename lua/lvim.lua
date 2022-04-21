local bi = lvim.builtin
local o = vim.opt
lvim.line_wrap_cursor_movement = true
bi.global_statusline = true
bi.fancy_statusline = true
bi.terminal.direction = "horizontal"
bi.terminal.shade_terminals = true
bi.terminal.shading_factor = 1
lvim.builtin.project.active = true
lvim.builtin.telescope.active = true
lvim.builtin.terminal.active = true
-- lvim.builtin.hlslens.active = true
bi.dap.active = true
-- lvim.builtin.terminal={
--   active = true,
--   open_mapping = true,
--   shade_terminals=true,
--   float_opts={
--       winblend=20,
--       border="curved"
--   },
--   shell="/bin/zsh",
-- }


-- local lsp= lvim.lsp
-- local plug = lvim.plugins
bi.lualine = require 'user.plug.lualine'
-- lvim.builtin.lualine.extensions={
-- }
--[[
lvim is the global options object
for lua, we need to create a lua table

l
require()
im.options = {

lvim.options.foo = "bar"
dlf
  ]]

bi.sell_your_soul_to_devil = true -- if you want microsoft to abuse your soul
lvim.transparent_windows = false
lvim.lsp.automatic_servers_installation = true
-- bi.orgmode.active = true -- change to true if you want orgmode.nvim

-- change to true if you want orgmode.nvim
lvim.lint_on_save = true
vim.opt.wrap = true
vim.opt.timeoutlen = 100

-- bi.telescope.extensions = {
--   fzf = {
--     active = true,
--   },
--   project = {
--     active = true,
--   },
--   file_browser = {
--     active = true,
--   },
-- }

lvim.log.level = "warn"
bi.gitsigns.active = true
bi.nvimtree.side = "left"
bi.nvimtree.show_icons.git = 1
bi.nvimtree.setup.filters.dotfiles = false
bi.notify.active = true
bi.file_browser = { active = true } -- enable/disable telescope file browser
bi.sniprun = { active = true }
bi.tag_provider = "symbols-outline" -- change this to use different tag providers ( symbols-outline or vista )
bi.editorconfig = { active = true } -- enable/disable editorconfig
bi.fancy_telescope = { active = true } -- telescope to the moon
bi.global_statusline = true -- set true to use global statusline
bi.treesitter.matchup.enable = true
bi.dap.active = true -- change this to enable/disable debugging
bi.fancy_wild_menu = { active = true } -- enable/disable use wilder.nvim
bi.fancy_rename = { active = true } -- enable/disable custom rename
bi.fancy_diff = { active = true } -- enable/disable fancier git diff
bi.lua_dev = { active = true } -- change this to enable/disable folke/lua_dev
lvim.builtin.test_runner = { active = true } -- change this to enable/disable vim-test, ultest
bi.cheat = { active = true } -- enable cheat.sh integration
bi.sql_integration = { active = true } -- use sql integration
-- lvim.builtin.neoscroll = { active = true } -- smooth scrolling
bi.neoclip = { active = true, enable_persistent_history = false }
bi.nonumber_unfocus = true -- diffrentiate between focused and non focused windows
bi.harpoon = { active = true } -- use the harpoon plugin
bi.remote_dev = { active = true } -- enable/disable remote development
bi.cursorline = { active = true } -- use a bit fancier cursorline
-- lvim.builtin.motion_provider = "hop" -- change this to use different motion providers ( hop or lightspeed )
bi.hlslens = { active = true } -- enable/disable hlslens
bi.csv_support = true -- enable/disable csv support
bi.sidebar = { active = true } -- enable/disable sidebar
bi.async_tasks = { active = true } -- enable/disable async tasks
bi.lastplace = { active = true } -- change to true if you are jumping to future
-- lvim.builtin.global_statusline = true
lvim.plugins = require("user.plug")
lvim.lsp.document_highlight = true
bi.nvim_web_devicons = { active = true }
-- bi.alpha.active = true
bi.notify.active = true
bi.nvimtree.setup.view.side = "left"
bi.bufferline.active = true -- this is actually using romgrk/barbar.nvim
bi.cmp.completion.keyword_length = 1
bi.telescope.defaults.layout_config.width = 0.95
bi.telescope.defaults.layout_config.preview_cutoff = 75

-- if you don't want all the parsers change this to a table of the ones you want
bi.treesitter.ensure_installed = { "rust", "python", "json", "zig", "c", "cpp", "javascript", "typescript", "html", "css", "yaml", "svelte", "json" }

bi.treesitter.highlight.enable = true
bi.treesitter.autotag.enable = true
bi.treesitter.ignore_install = { "rust", "haskell" }
bi.treesitter.matchup.enable = true
bi.treesitter.textsubjects.enable = true
bi.project.active = true
bi.sql_integration.active = true
bi.test_runner.active = true
-- bi.csv_support.active = true
bi.alpha.active = true
bi.sidebar.active = true

bi.fancy_statusline = true
bi.global_statusline = true
