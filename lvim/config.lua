local bi = lvim.builtin
local plug = require("user.plug")
lvim.plugins = {
  plug.neoscroll,
  -- plug.ayu,
  plug.tele_zox,
  plug.codeactionmenu,
  plug.nim,
  plug.zig,
  plug.go,
  plug.rust_tools,
  plug.lsp_signature,
  plug.crates,
  plug.zk,
  plug.searchbox,
  plug.qml,
  plug.lightbulb,
  plug.colorizer,
  plug.copilot,
  plug.copilotlua,
  plug.copilotcmp,
  plug.matchup,
  plug.surround,
  plug.cmpnvimlua,
  plug.cmpcmdline,
  plug.dap_virtual_text,
  plug.dapui,
  plug.catppuccin,
  plug.symbol_outline,
  plug.fzflua,
  plug.cmpsig,
  plug.cmpsym,
  plug.lush,
  plug.ts_utils,
  plug.fileb,
  plug.hls,
  plug.todo_comments,
  -- plug.neorg,
  plug.mkdnflow,
  plug.bqf,
  plug.fidget,
  plug.exi,
  plug.aerial,
  plug.cayu,
  plug.vimwiki,
  plug.trouble,
  plug.gps,
  plug.indent_blankline,
  plug.lightspeed,
  plug.telescope_project,
  plug.lastplace,
  { "tpope/vim-repeat" },
  -- plug.wilder,
  -- { 'cpea2506/one_monokai.nvim' },
  { "EdenEast/nightfox.nvim" },
  { "folke/tokyonight.nvim" },
}

local o = vim.opt
o.background = 'dark'
o.wildmenu = true
o.foldenable = false
o.termguicolors = true
o.pumheight = 0
o.signcolumn = 'yes'
o.pumwidth = 18
o.pumblend = 10
o.winblend = 15
o.cmdheight = 1
o.conceallevel = 3
o.concealcursor = 'nc'
o.wrap = true
o.showtabline = 2

require "telescope".load_extension("zk")
require "telescope".load_extension("fzf")
require "telescope".load_extension("projects")
require "telescope".load_extension("zoxide")


-- general
lvim.debug = false
lvim.log.level = "warn"
lvim.builtin.lualine.options.theme = "ayu_mirage"
lvim.line_wrap_cursor_movement = true
lvim.builtin.terminal.shading_factor = 1
lvim.transparent_window = true
lvim.format_on_save = false
bi.terminal.direction = "horizontal"
bi.dap.active = true
lvim.builtin.autopairs.active = true
lvim.builtin.treesitter.ensure_installed = {
  "rust", "c", "lua", "cpp", "python", "zig",
  "clojure", "go", "html", "css", "bash", "fish",
  "comment", "toml", "svelte", "gomod",
  "yaml", "json", "jsonc", "javascript", "typescript",
  "markdown", "scss"
  -- "tsx", "markdown", "comment", "html",
  -- "dockerfile", "clojure", "commonlisp", "go",
  -- "bash", "fish", "ruby", "dart", "query", "http",
  -- "dot", "hcl", "vim", "toml", "css", "nix", "elm",
  -- "rst", "norg", "hack", "llvm", "scss", "help",
  -- "elvish", "rego", "vala", "rasi", "make", "glsl",
  -- "java", "ruby", "scala", "slint", "hjson", "julia",
  -- "gleam", "cmake", "latex", "jsdoc", "regex", "prisma",
  -- "bibtex", "gomod", "ninja", "json5", "ocaml", "svelte",
  -- "elixir", "sparql", "kotlin", "fennel", "gowork", "scheme",
  -- "ledger", "fusion", "lalrpop", "glimmer", "todotxt", "ql",
  -- "haskell", "graphql", "solidity", "supercollider", "r",
  -- "vue"
}


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

vim.cmd [[ nnoremap ; :]]
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-Up>"] = false
lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
-- lvim.keys.normal_mode["n"] = ":NvimTreeToggle<CR>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaulbi.treesitter.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings.v = {
--   ":e ~/.config/lvim/config.lua<CR>", "Edit config"
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

lvim.builtin.alpha.active = true
lvim.builtin.notify.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
-- bi.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

bi.project.datapath = "$HOME/clp/proj/$"

lvim.builtin.lualine = require "user.plug.lualine"
-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supporbi.treesitter.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"

linters.setup {
  { command = "eslint_d", filetypes = { "javascript", "javascriptreact" }, },
  -- { command = "flake8", filetypes = { "python" } },
  -- { command = "black", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    filetypes = { "sh", "bash", "zsh" },
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supporbi.treesitter.
    filetypes = { "javascript", "python" },
  },
}

local plug = require("user.plug")

-- Additional Plugins

lvim.lsp.templates_dir = "/home/clp/clp/tmpl"
lvim.lsp.diagnostics.virtual_text = true
lvim.lsp.diagnostics.update_in_insert = true
-- lvim.lsp.diagnostics.underline = {
--   active = true,
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)

-- vim.cmd [[hi PmenuSel blend=5]]
-- vim.cmd [[hi TabLineSel blend=5]]
-- vim.cmd [[hi Normal blend=5]]
-- vim.cmd [[hi NvimTreeNormal blend=25]]


require("user.acmd")
require("user.color")
require("user.opt.lvim")
require("user.opt.nvim")
require("user.lsp.keys")
require("user.plug.autopairs")
require("user.lsp")
require("user.plug.cmp")
-- require("user.settings")
-- require("user.lvim")
lvim.builtin.telescope.extensions.fzf.enable = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.matchup.enable = true
-- lvim.extensions.project.enable = true
lvim.builtin.which_key.mappings["oP"] = {
  "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects"
}
vim.cmd [[nmap ; :]]
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
vim.g.ayucolor = "mirage"

vim.g.cayu_style = "night"
vim.g.cayu_italic_functions = true

lvim.colorscheme = "cayu"
-- lvim.colorscheme = "cayu"
-- vim.cmd [[ colorscheme ayu ]]
-- lvim.colorscheme = "ayu"

bi.terminal.shell = "/bin/fish"
bi.terminal.start_in_insert = true
bi.terminal.direction = "horizontal"
lvim.builtin.treesitter.autotag.enable = true
bi.terminal.shading_factor = 1
bi.treesitter.matchup.enable = true

vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'

-- vim.cmd [[ colorscheme cayu ]]


require("user.keys") -- $HOME/.config/lvim/lua/user/keys.lua
